import XCTest
import Combine
import SnapshotTesting
import Nimble
import Relay
@testable import RelayTestHelpers
@testable import RelaySwiftUI

class RefetchFragmentLoaderTests: XCTestCase {
    private var environment: MockEnvironment!
    private var resource: FragmentResource!
    private var queryResource: QueryResource!
    private var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        environment = MockEnvironment()
        environment.forceFetchFromStore = false
        resource = FragmentResource(environment: environment)
        queryResource = QueryResource(environment: environment)
        cancellables = Set<AnyCancellable>()
    }

    func testStartsWithNoData() throws {
        let loader = RefetchFragmentLoader<MovieInfoSection_film>()
        expect(loader.data).to(beNil())
    }

    func testLoadsDataFromTheStore() throws {
        let loader = RefetchFragmentLoader<MovieInfoSection_film>()
        let selector = try load(MovieDetail.newHope)
        let key = getMovieKey(selector)
        loader.load(from: resource, queryResource: queryResource, key: key)
        expect(loader.data).notTo(beNil())
        assertSnapshot(matching: loader.data, as: .dump)
    }

    func testReloadsOnRelevantStoreChanges() throws {
        let loader = RefetchFragmentLoader<MovieInfoSection_film>()
        let selector = try load(MovieDetail.newHope)
        let key = getMovieKey(selector)
        loader.load(from: resource, queryResource: queryResource, key: key)
        expect(loader.data).notTo(beNil())
        assertSnapshot(matching: loader.data, as: .dump)

        var snapshots: [Snapshot<MovieInfoSection_film.Data?>?] = []
        loader.$snapshot.dropFirst().sink { snapshots.append($0) }.store(in: &cancellables)

        // update the store with changes
        try environment.cachePayload(MoviesTabQuery(), MoviesTab.evenNewerHope)

        expect(snapshots).toEventually(haveCount(1))
        expect(loader.data!.title) == "An Even Newer Hope"
        assertSnapshot(matching: loader.data, as: .dump)
    }

    func testDoesNotReloadOnIrrelevantStoreChanges() throws {
        let loader = RefetchFragmentLoader<MovieInfoSection_film>()
        let selector = try load(MovieDetail.newHope)
        let key = getMovieKey(selector)
        loader.load(from: resource, queryResource: queryResource, key: key)
        expect(loader.data).notTo(beNil())
        assertSnapshot(matching: loader.data, as: .dump)

        var snapshots: [Snapshot<MovieInfoSection_film.Data?>?] = []
        loader.$snapshot.dropFirst().sink { snapshots.append($0) }.store(in: &cancellables)

        // update the store with changes
        try environment.cachePayload(MoviesTabQuery(), MoviesTab.empireStrikesAgain)

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.2))
        expect(snapshots).to(beEmpty())
    }

    func testDoesNotReloadWhenLoadingTheSameKey() throws {
        let loader = RefetchFragmentLoader<MovieInfoSection_film>()
        let selector = try load(MovieDetail.newHope)
        let key = getMovieKey(selector)
        loader.load(from: resource, queryResource: queryResource, key: key)
        expect(loader.data).notTo(beNil())
        assertSnapshot(matching: loader.data, as: .dump)

        var snapshots: [Snapshot<MovieInfoSection_film.Data?>?] = []
        loader.$snapshot.dropFirst().sink { snapshots.append($0) }.store(in: &cancellables)

        loader.load(from: resource, queryResource: queryResource, key: key)

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.2))
        expect(snapshots).to(beEmpty())
    }

    func testRefetchesDataWhenAsked() async throws {
        let loader = RefetchFragmentLoader<MovieInfoSection_film>()
        let selector = try load(MovieDetail.newHope)
        let key = getMovieKey(selector)
        loader.load(from: resource, queryResource: queryResource, key: key)
        expect(loader.data).notTo(beNil())
        assertSnapshot(matching: loader.data, as: .dump)

        // calling loader.refetch() should always update the refetch key, which would cause SwiftUI to recall load
        // we're not running inside SwiftUI, though, so we must do it ourselves

        var refetchKeys: [UUID] = []
        loader.$refetchKey.dropFirst().sink { refetchKeys.append($0) }.store(in: &cancellables)
        expect(refetchKeys).to(beEmpty())

        let advance = try environment.delayMockedResponse(MovieInfoSectionRefetchQuery(id: "ZmlsbXM6MQ=="), MovieInfoSection.refetchEvenNewerHope)
        await loader.refetch(nil, from: resource, queryResource: queryResource, key: key)

        expect(refetchKeys).toEventually(haveCount(1))
        loader.load(from: resource, queryResource: queryResource, key: key)

        var snapshots: [Snapshot<MovieInfoSection_film.Data?>?] = []
        loader.$snapshot.dropFirst().sink { snapshots.append($0) }.store(in: &cancellables)
        expect(snapshots).to(beEmpty())

        advance()

        // this has two snapshots because the previous subscription isn't broken until there is data from the new query, but they
        // update the same record. so we get one update with a snapshot from the original owner, and then another from the refetch
        // query. this is fine.
        expect(snapshots).toEventually(haveCount(2))
        expect(loader.data!.title) == "An Even Newer Hope"
        assertSnapshot(matching: loader.data, as: .dump)

        // now verify that if we call load again (which will happen in SwiftUI when the snapshot updates), we don't cycle and keep
        // resetting the snapshot.
        loader.load(from: resource, queryResource: queryResource, key: key)
        expect(snapshots).to(haveCount(2))
    }

    func testRefetchesDataWithNewVariables() async throws {
        let loader = RefetchFragmentLoader<MovieInfoSection_film>()
        let selector = try load(MovieDetail.newHope)
        let key = getMovieKey(selector)
        loader.load(from: resource, queryResource: queryResource, key: key)
        expect(loader.data).notTo(beNil())
        assertSnapshot(matching: loader.data, as: .dump)

        // calling loader.refetch() should always update the refetch key, which would cause SwiftUI to recall load
        // we're not running inside SwiftUI, though, so we must do it ourselves

        var refetchKeys: [UUID] = []
        loader.$refetchKey.dropFirst().sink { refetchKeys.append($0) }.store(in: &cancellables)
        expect(refetchKeys).to(beEmpty())

        // refetch with a different ID
        let advance = try environment.delayMockedResponse(MovieInfoSectionRefetchQuery(id: "ZmlsbXM6Mg=="), MovieInfoSection.refetchEmpire)
        await loader.refetch(.init(id: "ZmlsbXM6Mg=="), from: resource, queryResource: queryResource, key: key)

        expect(refetchKeys).toEventually(haveCount(1))
        loader.load(from: resource, queryResource: queryResource, key: key)

        var snapshots: [Snapshot<MovieInfoSection_film.Data?>?] = []
        loader.$snapshot.dropFirst().sink { snapshots.append($0) }.store(in: &cancellables)
        expect(snapshots).to(beEmpty())

        advance()

        expect(snapshots).toEventually(haveCount(1))
        expect(loader.data!.title) == "The Empire Strikes Back"
        assertSnapshot(matching: loader.data, as: .dump)

        // now verify that if we call load again (which will happen in SwiftUI when the snapshot updates), we don't cycle and keep
        // resetting the snapshot.
        loader.load(from: resource, queryResource: queryResource, key: key)
        expect(snapshots).to(haveCount(1))
    }

    func testRetainsDataFromRefetchQuery() async throws {
        let loader = RefetchFragmentLoader<MovieInfoSection_film>()
        let selector = try load(MovieDetail.newHope)
        let key = getMovieKey(selector)
        loader.load(from: resource, queryResource: queryResource, key: key)
        expect(loader.data).notTo(beNil())

        var refetchKeys: [UUID] = []
        loader.$refetchKey.dropFirst().sink { refetchKeys.append($0) }.store(in: &cancellables)
        expect(refetchKeys).to(beEmpty())

        // refetch with a different ID
        let advance = try environment.delayMockedResponse(MovieInfoSectionRefetchQuery(id: "ZmlsbXM6Mg=="), MovieInfoSection.refetchEmpire)
        await loader.refetch(.init(id: "ZmlsbXM6Mg=="), from: resource, queryResource: queryResource, key: key)

        expect(refetchKeys).toEventually(haveCount(1))
        loader.load(from: resource, queryResource: queryResource, key: key)

        var snapshots: [Snapshot<MovieInfoSection_film.Data?>?] = []
        loader.$snapshot.dropFirst().sink { snapshots.append($0) }.store(in: &cancellables)
        expect(snapshots).to(beEmpty())

        advance()

        expect(snapshots).toEventually(haveCount(1))
        expect(loader.data!.title) == "The Empire Strikes Back"

        // force a GC by retaining and releasing an unrelated query
        let otherQuery = environment.retain(operation: MoviesTabQuery().createDescriptor())
        otherQuery.cancel()
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.2))

        assertSnapshot(matching: environment.store.source, as: .recordSource)
    }

    private func load(_ payload: String) throws -> SingularReaderSelector {
        let op = MovieDetailQuery(id: "ZmlsbXM6MQ==")
        try environment.cachePayload(op, payload)
        let operation = op.createDescriptor()

        // simulate the retain that the QueryLoader would be doing.
        environment.retain(operation: operation).store(in: &cancellables)

        return operation.fragment
    }

    private func getMovieKey(_ querySelector: SingularReaderSelector, index: Int = 0) -> MovieInfoSection_film.Key {
        let snapshot: Snapshot<MovieDetailQuery.Data?> = environment.lookup(selector: querySelector)
        return snapshot.data!.film!
    }
}
