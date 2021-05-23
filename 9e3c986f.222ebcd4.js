(window.webpackJsonp=window.webpackJsonp||[]).push([[55],{120:function(e,t,r){"use strict";r.r(t),r.d(t,"frontMatter",(function(){return o})),r.d(t,"metadata",(function(){return l})),r.d(t,"toc",(function(){return c})),r.d(t,"default",(function(){return m}));var n=r(3),a=r(7),i=(r(0),r(154)),o={title:"@RefetchableFragment"},l={unversionedId:"api/refetchable-fragment",id:"api/refetchable-fragment",isDocsHomePage:!1,title:"@RefetchableFragment",description:"The @RefetchableFragment property wrapper is very similar to a @Fragment, but it supports refetching the latest data from the server on-demand.",source:"@site/docs/api/refetchable-fragment.md",slug:"/api/refetchable-fragment",permalink:"/Relay.swift/docs/next/api/refetchable-fragment",editUrl:"https://github.com/relay-tools/Relay.swift/edit/main/website/docs/api/refetchable-fragment.md",version:"current",sidebar:"docs",previous:{title:"@Fragment",permalink:"/Relay.swift/docs/next/api/fragment"},next:{title:"@PaginationFragment",permalink:"/Relay.swift/docs/next/api/pagination-fragment"}},c=[{value:"Example",id:"example",children:[]},{value:"Requirements",id:"requirements",children:[]}],p={toc:c};function m(e){var t=e.components,r=Object(a.a)(e,["components"]);return Object(i.b)("wrapper",Object(n.a)({},p,r,{components:t,mdxType:"MDXLayout"}),Object(i.b)("p",null,"The ",Object(i.b)("inlineCode",{parentName:"p"},"@RefetchableFragment")," property wrapper is very similar to a ",Object(i.b)("a",{parentName:"p",href:"/Relay.swift/docs/next/api/fragment"},"@Fragment"),", but it supports refetching the latest data from the server on-demand."),Object(i.b)("h2",{id:"example"},"Example"),Object(i.b)("pre",null,Object(i.b)("code",{parentName:"pre",className:"language-swift"},'import SwiftUI\nimport RelaySwiftUI\n\nprivate let itemFragment = graphql("""\nfragment ToDoItem_item on Item\n  @refetchable(queryName: "ToDoItemRefetchQuery") {\n  text\n  complete\n}\n""")\n\nstruct ToDoList: View {\n    @RefetchableFragment<ToDoItem_item> var item\n\n    var body: some View {\n        if let item = item {\n            HStack {\n                Image(systemName: item.complete ? "checkmark.square" : "square")\n                Text("\\(item.text)")\n\n                Spacer()\n\n                Button {\n                    item.refetch()\n                } label: {\n                    Image(systemName: "arrow.clockwise.circle.fill")\n                }\n            }\n        }\n    }\n}\n')),Object(i.b)("h2",{id:"requirements"},"Requirements"),Object(i.b)("p",null,"The fragment must have a ",Object(i.b)("inlineCode",{parentName:"p"},"@refetchable")," directive that names a query operation that will be generated to refetch the data for the fragment. Using ",Object(i.b)("inlineCode",{parentName:"p"},"@refetchable")," requires that the fragment be declared on ",Object(i.b)("inlineCode",{parentName:"p"},"Query"),", ",Object(i.b)("inlineCode",{parentName:"p"},"Viewer"),", or a type that implements the ",Object(i.b)("inlineCode",{parentName:"p"},"Node")," interface. Otherwise, Relay won't know where in the graph to fetch the new data from."),Object(i.b)("h4",{id:"property-value"},"Property value"),Object(i.b)("p",null,"The ",Object(i.b)("inlineCode",{parentName:"p"},"@RefetchableFragment")," property will be a read-only optional value with the fields the fragment requests. This value will automatically update and re-render the view when the Relay store updates any relevant records, including when the data is refetched."),Object(i.b)("p",null,"The property value will also include a function to trigger the refresh:"),Object(i.b)("ul",null,Object(i.b)("li",{parentName:"ul"},Object(i.b)("inlineCode",{parentName:"li"},"refetch(_ variables: Variables? = nil)"),": Function that can be called to trigger a refetch of the fragment's data. ",Object(i.b)("inlineCode",{parentName:"li"},"variables")," will be the variables for the refetch query that Relay generates for you. This may change which node the fragment is targetting from then on. That's okay: Relay will keep track of that for you, but be aware that it may not match the original fragment your view is passing in.")))}m.isMDXComponent=!0},154:function(e,t,r){"use strict";r.d(t,"a",(function(){return f})),r.d(t,"b",(function(){return b}));var n=r(0),a=r.n(n);function i(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function o(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function l(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?o(Object(r),!0).forEach((function(t){i(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):o(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function c(e,t){if(null==e)return{};var r,n,a=function(e,t){if(null==e)return{};var r,n,a={},i=Object.keys(e);for(n=0;n<i.length;n++)r=i[n],t.indexOf(r)>=0||(a[r]=e[r]);return a}(e,t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);for(n=0;n<i.length;n++)r=i[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(a[r]=e[r])}return a}var p=a.a.createContext({}),m=function(e){var t=a.a.useContext(p),r=t;return e&&(r="function"==typeof e?e(t):l(l({},t),e)),r},f=function(e){var t=m(e.components);return a.a.createElement(p.Provider,{value:t},e.children)},s={inlineCode:"code",wrapper:function(e){var t=e.children;return a.a.createElement(a.a.Fragment,{},t)}},u=a.a.forwardRef((function(e,t){var r=e.components,n=e.mdxType,i=e.originalType,o=e.parentName,p=c(e,["components","mdxType","originalType","parentName"]),f=m(r),u=n,b=f["".concat(o,".").concat(u)]||f[u]||s[u]||i;return r?a.a.createElement(b,l(l({ref:t},p),{},{components:r})):a.a.createElement(b,l({ref:t},p))}));function b(e,t){var r=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var i=r.length,o=new Array(i);o[0]=u;var l={};for(var c in t)hasOwnProperty.call(t,c)&&(l[c]=t[c]);l.originalType=e,l.mdxType="string"==typeof e?e:n,o[1]=l;for(var p=2;p<i;p++)o[p]=r[p];return a.a.createElement.apply(null,o)}return a.a.createElement.apply(null,r)}u.displayName="MDXCreateElement"}}]);