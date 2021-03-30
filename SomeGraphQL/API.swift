// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class SearchReposQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SearchRepos($searchText: String!) {
      search(first: 1, query: $searchText, type: REPOSITORY) {
        __typename
        nodes {
          __typename
          ... on Repository {
            ...RepositoryDetail
          }
        }
      }
    }
    """

  public let operationName: String = "SearchRepos"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + RepositoryDetail.fragmentDefinition)
    return document
  }

  public var searchText: String

  public init(searchText: String) {
    self.searchText = searchText
  }

  public var variables: GraphQLMap? {
    return ["searchText": searchText]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("search", arguments: ["first": 1, "query": GraphQLVariable("searchText"), "type": "REPOSITORY"], type: .nonNull(.object(Search.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    /// Perform a search across resources.
    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SearchResultItemConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of nodes.
      public var nodes: [Node?]? {
        get {
          return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["App", "Issue", "MarketplaceListing", "Organization", "PullRequest", "Repository", "User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["Repository": AsRepository.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeApp() -> Node {
          return Node(unsafeResultMap: ["__typename": "App"])
        }

        public static func makeIssue() -> Node {
          return Node(unsafeResultMap: ["__typename": "Issue"])
        }

        public static func makeMarketplaceListing() -> Node {
          return Node(unsafeResultMap: ["__typename": "MarketplaceListing"])
        }

        public static func makeOrganization() -> Node {
          return Node(unsafeResultMap: ["__typename": "Organization"])
        }

        public static func makePullRequest() -> Node {
          return Node(unsafeResultMap: ["__typename": "PullRequest"])
        }

        public static func makeUser() -> Node {
          return Node(unsafeResultMap: ["__typename": "User"])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asRepository: AsRepository? {
          get {
            if !AsRepository.possibleTypes.contains(__typename) { return nil }
            return AsRepository(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsRepository: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Repository"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(RepositoryDetail.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var repositoryDetail: RepositoryDetail {
              get {
                return RepositoryDetail(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public final class AddStarMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddStar($repositoryId: ID!) {
      addStar(input: {clientMutationId: "2277541", starrableId: $repositoryId}) {
        __typename
        starrable {
          __typename
          ... on Repository {
            ...RepositoryDetail
          }
        }
      }
    }
    """

  public let operationName: String = "AddStar"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + RepositoryDetail.fragmentDefinition)
    return document
  }

  public var repositoryId: GraphQLID

  public init(repositoryId: GraphQLID) {
    self.repositoryId = repositoryId
  }

  public var variables: GraphQLMap? {
    return ["repositoryId": repositoryId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addStar", arguments: ["input": ["clientMutationId": "2277541", "starrableId": GraphQLVariable("repositoryId")]], type: .object(AddStar.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addStar: AddStar? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addStar": addStar.flatMap { (value: AddStar) -> ResultMap in value.resultMap }])
    }

    /// Adds a star to a Starrable.
    public var addStar: AddStar? {
      get {
        return (resultMap["addStar"] as? ResultMap).flatMap { AddStar(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addStar")
      }
    }

    public struct AddStar: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AddStarPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("starrable", type: .object(Starrable.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(starrable: Starrable? = nil) {
        self.init(unsafeResultMap: ["__typename": "AddStarPayload", "starrable": starrable.flatMap { (value: Starrable) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The starrable.
      public var starrable: Starrable? {
        get {
          return (resultMap["starrable"] as? ResultMap).flatMap { Starrable(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "starrable")
        }
      }

      public struct Starrable: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Gist", "Repository", "Topic"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["Repository": AsRepository.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeGist() -> Starrable {
          return Starrable(unsafeResultMap: ["__typename": "Gist"])
        }

        public static func makeTopic() -> Starrable {
          return Starrable(unsafeResultMap: ["__typename": "Topic"])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asRepository: AsRepository? {
          get {
            if !AsRepository.possibleTypes.contains(__typename) { return nil }
            return AsRepository(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsRepository: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Repository"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(RepositoryDetail.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var repositoryDetail: RepositoryDetail {
              get {
                return RepositoryDetail(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public final class RemoveStarMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RemoveStar($repositoryId: ID!) {
      removeStar(input: {clientMutationId: "2277541", starrableId: $repositoryId}) {
        __typename
        starrable {
          __typename
          ... on Repository {
            ...RepositoryDetail
          }
        }
      }
    }
    """

  public let operationName: String = "RemoveStar"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + RepositoryDetail.fragmentDefinition)
    return document
  }

  public var repositoryId: GraphQLID

  public init(repositoryId: GraphQLID) {
    self.repositoryId = repositoryId
  }

  public var variables: GraphQLMap? {
    return ["repositoryId": repositoryId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("removeStar", arguments: ["input": ["clientMutationId": "2277541", "starrableId": GraphQLVariable("repositoryId")]], type: .object(RemoveStar.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeStar: RemoveStar? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "removeStar": removeStar.flatMap { (value: RemoveStar) -> ResultMap in value.resultMap }])
    }

    /// Removes a star from a Starrable.
    public var removeStar: RemoveStar? {
      get {
        return (resultMap["removeStar"] as? ResultMap).flatMap { RemoveStar(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "removeStar")
      }
    }

    public struct RemoveStar: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RemoveStarPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("starrable", type: .object(Starrable.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(starrable: Starrable? = nil) {
        self.init(unsafeResultMap: ["__typename": "RemoveStarPayload", "starrable": starrable.flatMap { (value: Starrable) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The starrable.
      public var starrable: Starrable? {
        get {
          return (resultMap["starrable"] as? ResultMap).flatMap { Starrable(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "starrable")
        }
      }

      public struct Starrable: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Gist", "Repository", "Topic"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["Repository": AsRepository.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeGist() -> Starrable {
          return Starrable(unsafeResultMap: ["__typename": "Gist"])
        }

        public static func makeTopic() -> Starrable {
          return Starrable(unsafeResultMap: ["__typename": "Topic"])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asRepository: AsRepository? {
          get {
            if !AsRepository.possibleTypes.contains(__typename) { return nil }
            return AsRepository(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsRepository: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Repository"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(RepositoryDetail.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var repositoryDetail: RepositoryDetail {
              get {
                return RepositoryDetail(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public struct RepositoryDetail: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment RepositoryDetail on Repository {
      __typename
      id
      nameWithOwner
      viewerHasStarred
      stargazers {
        __typename
        totalCount
      }
    }
    """

  public static let possibleTypes: [String] = ["Repository"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
      GraphQLField("viewerHasStarred", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, nameWithOwner: String, viewerHasStarred: Bool, stargazers: Stargazer) {
    self.init(unsafeResultMap: ["__typename": "Repository", "id": id, "nameWithOwner": nameWithOwner, "viewerHasStarred": viewerHasStarred, "stargazers": stargazers.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The repository's name with owner.
  public var nameWithOwner: String {
    get {
      return resultMap["nameWithOwner"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "nameWithOwner")
    }
  }

  /// Returns a boolean indicating whether the viewing user has starred this starrable.
  public var viewerHasStarred: Bool {
    get {
      return resultMap["viewerHasStarred"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "viewerHasStarred")
    }
  }

  /// A list of users who have starred this starrable.
  public var stargazers: Stargazer {
    get {
      return Stargazer(unsafeResultMap: resultMap["stargazers"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "stargazers")
    }
  }

  public struct Stargazer: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["StargazerConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }
}
