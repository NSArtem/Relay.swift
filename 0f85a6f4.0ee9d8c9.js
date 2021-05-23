(window.webpackJsonp=window.webpackJsonp||[]).push([[9],{154:function(e,t,a){"use strict";a.d(t,"a",(function(){return p})),a.d(t,"b",(function(){return h}));var n=a(0),r=a.n(n);function i(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function o(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function s(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?o(Object(a),!0).forEach((function(t){i(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):o(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function l(e,t){if(null==e)return{};var a,n,r=function(e,t){if(null==e)return{};var a,n,r={},i=Object.keys(e);for(n=0;n<i.length;n++)a=i[n],t.indexOf(a)>=0||(r[a]=e[a]);return r}(e,t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);for(n=0;n<i.length;n++)a=i[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(r[a]=e[a])}return r}var c=r.a.createContext({}),f=function(e){var t=r.a.useContext(c),a=t;return e&&(a="function"==typeof e?e(t):s(s({},t),e)),a},p=function(e){var t=f(e.components);return r.a.createElement(c.Provider,{value:t},e.children)},u={inlineCode:"code",wrapper:function(e){var t=e.children;return r.a.createElement(r.a.Fragment,{},t)}},d=r.a.forwardRef((function(e,t){var a=e.components,n=e.mdxType,i=e.originalType,o=e.parentName,c=l(e,["components","mdxType","originalType","parentName"]),p=f(a),d=n,h=p["".concat(o,".").concat(d)]||p[d]||u[d]||i;return a?r.a.createElement(h,s(s({ref:t},c),{},{components:a})):r.a.createElement(h,s({ref:t},c))}));function h(e,t){var a=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var i=a.length,o=new Array(i);o[0]=d;var s={};for(var l in t)hasOwnProperty.call(t,l)&&(s[l]=t[l]);s.originalType=e,s.mdxType="string"==typeof e?e:n,o[1]=s;for(var c=2;c<i;c++)o[c]=a[c];return r.a.createElement.apply(null,o)}return r.a.createElement.apply(null,a)}d.displayName="MDXCreateElement"},72:function(e,t,a){"use strict";a.r(t),a.d(t,"frontMatter",(function(){return o})),a.d(t,"metadata",(function(){return s})),a.d(t,"toc",(function(){return l})),a.d(t,"default",(function(){return f}));var n=a(3),r=a(7),i=(a(0),a(154)),o={title:"Differences from Relay in JavaScript"},s={unversionedId:"knowledge-base/differences-from-javascript",id:"knowledge-base/differences-from-javascript",isDocsHomePage:!1,title:"Differences from Relay in JavaScript",description:"Relay.swift is not intended to replace the official Relay framework for JavaScript. We love Relay, and we want to bring the same benefits that it brings to building web apps to a new environment: building native apps for Apple platforms with Swift.",source:"@site/docs/knowledge-base/differences-from-javascript.md",slug:"/knowledge-base/differences-from-javascript",permalink:"/Relay.swift/docs/next/knowledge-base/differences-from-javascript",editUrl:"https://github.com/relay-tools/Relay.swift/edit/main/website/docs/knowledge-base/differences-from-javascript.md",version:"current"},l=[{value:"Relay.swift vs. Relay",id:"relayswift-vs-relay",children:[]},{value:"RelaySwiftUI vs. react-relay",id:"relayswiftui-vs-react-relay",children:[]}],c={toc:l};function f(e){var t=e.components,a=Object(r.a)(e,["components"]);return Object(i.b)("wrapper",Object(n.a)({},c,a,{components:t,mdxType:"MDXLayout"}),Object(i.b)("p",null,"Relay.swift is not intended to replace the official Relay framework for JavaScript. We love Relay, and we want to bring the same benefits that it brings to building web apps to a new environment: building native apps for Apple platforms with Swift."),Object(i.b)("p",null,"Relay.swift was created by spending a bunch of time heads down in Relay's source code, understanding how it does what it does. For the most part, the API should be the same or similar to the original. When things diverge in a significant way, it's usually because of fundamental underlying differences in the two environments. This page explains some of those differences."),Object(i.b)("h2",{id:"relayswift-vs-relay"},"Relay.swift vs. Relay"),Object(i.b)("p",null,"Relay is written in JavaScript using Flow to provide a type system. Flow is very different from Swift's type system because for the most part, Flow types are ",Object(i.b)("strong",{parentName:"p"},"structural"),". This means that a value is of a certain type based on the structure of the value. As long as two types require the same structure, they are effectively the same type: if a value conforms to one of them, it conforms to the other. Swift doesn't support structural typing at all: instead, Swift has exclusively ",Object(i.b)("strong",{parentName:"p"},"nominal")," types. In Swift, the name of a type matters, and values know the name of their type. This means that if we define two ",Object(i.b)("inlineCode",{parentName:"p"},"struct"),"s in Swift with the exact same fields, we still can't treat a value of one of those types as the other type."),Object(i.b)("p",null,"Relay takes advantage of structural types in Flow both in its internals and in the type definitions that its compiler generates for query data:"),Object(i.b)("ul",null,Object(i.b)("li",{parentName:"ul"},"It is able to use plain-old JavaScript objects to represent query data and enforce types on the structure of those objects at the boundary between the Relay framework and the app without any explicit conversion code."),Object(i.b)("li",{parentName:"ul"},"For nested fields in query data, Relay only needs to generate named types for the top-level: the structure of nested fields is embedded inside those types without needing to named and defined elsewhere."),Object(i.b)("li",{parentName:"ul"},"For input types and enums, which can be reused across many queries, mutations, and fragments, Relay can generate types in each file that uses them. Because the structure of the types match, values can be used interchangeably with them.")),Object(i.b)("p",null,"Relay.swift has to take a different approach, both to how it stores records and how it generates types, to work within the bounds of nominal typing:"),Object(i.b)("ul",null,Object(i.b)("li",{parentName:"ul"},"Internally, Relay.swift stores records with dictionaries, similar to the JS objects Relay uses, because the shape of records is heterogenous and not known ahead of time. But when data is read out of the store, it has to be converted into named Swift structs that are generated by the Relay compiler. This is only way to express the types of specific fields in Swift, so that consumers of the data can only access the fields specified in the query."),Object(i.b)("li",{parentName:"ul"},"Every nested field in those structs needs its own named type as well. The compiler can't just generate these based on the GraphQL schema and reuse them either, because queries may alias fields or select different fields for the same object type in different places. To handle this, nested fields each get a nested struct type named after both the type name in the schema and the field name in the query, preventing collisions."),Object(i.b)("li",{parentName:"ul"},"This approach doesn't work for input types and enums, because their values should be usable in any place that expects them. If two different fields in a query are of the same enum type, values from one of those fields should be comparable to values from the other. For these types, the compiler generates an ",Object(i.b)("inlineCode",{parentName:"li"},"enum")," for GraphQL enums and a ",Object(i.b)("inlineCode",{parentName:"li"},"struct")," for GraphQL input types the first time it generates a file that uses the type. Swift thankfully doesn't care which file the type is in: anything in the module can use it.")),Object(i.b)("h2",{id:"relayswiftui-vs-react-relay"},"RelaySwiftUI vs. react-relay"),Object(i.b)("p",null,"There are other differences between Relay.swift and Relay on the UI side."),Object(i.b)("p",null,"First, while in Relay.swift you still write your queries inside tagged strings in your source code, they can't actually stand in for the compiled version of the query. Relay uses a Babel plugin to transform tagged ",Object(i.b)("inlineCode",{parentName:"p"},"graphql")," string literals into imports of the compiled version from the Relay compiler, but Swift doesn't have an equivalent way of doing arbitrary transforms to code as it is compiled."),Object(i.b)("p",null,"Instead, you still tag your GraphQL queries in Relay.swift using the ",Object(i.b)("inlineCode",{parentName:"p"},"graphql")," function, but it only serves to flag the query to the Relay compiler. Once the compiled version of the query is generated, you can reference the generated type explicitly when calling into Relay. This is the easiest way to preserve type information about the query variables and response."),Object(i.b)("p",null,"Relay.swift uses property wrappers to achieve a similar effect in SwiftUI to what hooks do in React. If you've tried the experimental hooks API for Relay, Relay.swift's property wrappers should feel at least a little familiar. They're a little more finicky about how you use them, but for the most part, we can accomplish a lot of the same things with property wrappers in SwiftUI that React libraries can do with hooks."))}f.isMDXComponent=!0}}]);