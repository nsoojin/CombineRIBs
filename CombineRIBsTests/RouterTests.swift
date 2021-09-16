//
//  Copyright (c) 2017. Uber Technologies
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Combine
import XCTest
@testable import CombineRIBs

final class RouterTests: XCTestCase {

    private var router: Router<Interactable>!
    private var lifecycleCancellable: AnyCancellable!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        router = Router(interactor: InteractableMock())
    }

    override func tearDown() {
        super.tearDown()

        lifecycleCancellable.cancel()
    }

    // MARK: - Tests

    func test_load_verifyLifecyclePublisher() {
        var currentLifecycle: RouterLifecycle?
        var didComplete = false
        lifecycleCancellable = router
            .lifecycle
            .sink(receiveCompletion: { _ in
                currentLifecycle = nil
                didComplete = true
            }, receiveValue: { lifecycle in
                currentLifecycle = lifecycle
            })

        XCTAssertNil(currentLifecycle)
        XCTAssertFalse(didComplete)

        router.load()

        XCTAssertEqual(currentLifecycle, RouterLifecycle.didLoad)
        XCTAssertFalse(didComplete)

        router = nil

        XCTAssertNil(currentLifecycle)
        XCTAssertTrue(didComplete)
    }
}