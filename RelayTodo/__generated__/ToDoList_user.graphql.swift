// Auto-generated by relay-compiler. Do not edit.

import Relay

public struct ToDoList_user {
    public var fragmentPointer: FragmentPointer

    public init(key: ToDoList_user_Key) {
        fragmentPointer = key.fragment_ToDoList_user
    }

    public static var node: ReaderFragment {
        ReaderFragment(
            name: "ToDoList_user",
            type: "User",
            selections: [
                .field(ReaderLinkedField(
                    name: "todos",
                    storageKey: "todos(first:100)",
                    args: [
                        LiteralArgument(name: "first", value: 100)
                    ],
                    concreteType: "TodoConnection",
                    plural: false,
                    selections: [
                        .field(ReaderLinkedField(
                            name: "edges",
                            concreteType: "TodoEdge",
                            plural: true,
                            selections: [
                                .field(ReaderLinkedField(
                                    name: "node",
                                    concreteType: "Todo",
                                    plural: false,
                                    selections: [
                                        .field(ReaderScalarField(
                                            name: "id"
                                        )),
                                        .fragmentSpread(ReaderFragmentSpread(
                                            name: "ToDoItem_todo"
                                        ))
                                    ]
                                ))
                            ]
                        ))
                    ]
                ))
            ]
        )
    }
}

extension ToDoList_user {
    public struct Data: Decodable {
        public var todos: TodoConnection_todos?

        public struct TodoConnection_todos: Decodable {
            public var edges: [TodoEdge_edges?]?

            public struct TodoEdge_edges: Decodable {
                public var node: Todo_node?

                public struct Todo_node: Decodable, Identifiable, ToDoItem_todo_Key {
                    public var id: String
                    public var fragment_ToDoItem_todo: FragmentPointer
                }
            }
        }
    }
}

public protocol ToDoList_user_Key {
    var fragment_ToDoList_user: FragmentPointer { get }
}

extension ToDoList_user: Relay.Fragment {}

#if canImport(RelaySwiftUI)
import RelaySwiftUI

extension ToDoList_user_Key {
    public func asFragment() -> RelaySwiftUI.Fragment<ToDoList_user> {
        RelaySwiftUI.Fragment<ToDoList_user>(self)
    }
}
#endif