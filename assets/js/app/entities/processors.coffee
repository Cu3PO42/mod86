define ["app"], (mod86) ->
    mod86.module "Entities", (Entities, mod86, Backbone, Marionette, $, _) ->
        mod86.reqres.setHandler "processors:list", -> [
            {
                name: "Bonsai"
                id: 1
                description: "Der Bonsai Lerncomputer"
                author: "Klaus Merkert"
            }
        ]

        mod86.reqres.setHandler "processors:item", (id) ->
            {
                1:
                    type: "Bonsai"
                    id: 2
                    description: "Der Bonsai Lerncomputer"
                    author: "Klaus Merkert"
                    pieces: [
                        {
                            type: "ProgramCounter"
                            id: 1
                            x: 200
                            y: 0
                            counter: 1
                        }
                        {
                            type: "Memory"
                            id: 2
                            x: 0
                            y: 200
                            memory: [10, 5]
                        }
                        {
                            type: "OpcodeSplitter"
                            id: 3
                            x: 200
                            y: 200
                        }
                        {
                            type: "Accumulator"
                            id: 4
                            x: 0
                            y: 450
                        }
                        {
                            type: "Bus"
                            id: 5
                            coord: 125
                        }
                        {
                            type: "Bus"
                            id: 6
                            coord: 350
                        }
                        {
                            type: "DirectLane"
                            id: 21
                        }
                        {
                            type: "DirectLane"
                            id: 22
                        }
                        {
                            type: "DirectLane"
                            id: 23
                        }
                        {
                            type: "DirectLane"
                            id: 24
                        }
                        {
                            type: "DirectLane"
                            id: 25
                        }
                        {
                            type: "DeviceLane"
                            id: 7
                            device: 1
                            prop: "counter"
                        }
                        {
                            type: "DeviceLane"
                            id: 31
                            device: 1
                            prop: "adder"
                        }
                        {
                            type: "DeviceLane"
                            id: 8
                            device: 2
                            prop: "address"
                        }
                        {
                            type: "DeviceLane"
                            id: 9
                            device: 2
                            prop: "value"
                        }
                        {
                            type: "DeviceLane"
                            id: 10
                            device: 3
                            prop: "opcode"
                        }
                        {
                            type: "DeviceLane"
                            id: 11
                            device: 3
                            prop: "address"
                        }
                        {
                            type: "DeviceLane"
                            id: 12
                            device: 3
                            prop: "value"
                        }
                        {
                            type: "DeviceLane"
                            id: 13
                            device: 4
                            prop: "value"
                        }
                        {
                            type: "LaneAccess"
                            id: 14
                            device: 7
                            lane: 5
                            x: obj: 1
                            y:
                                obj: 1
                                offset: 60
                            direction: 1
                        }
                        {
                            type: "LaneReadOnlyAccess"
                            id: 32
                            device: 31
                            lane: 25
                            x: 400
                            y: obj: 1
                            direction: 0
                        }
                        {
                            type: "LaneReadOnlyAccess"
                            id: 15
                            device: 8
                            lane: 5
                            x:
                                obj: 2
                                prop: "address"
                            y:
                                obj: 2
                                prop: "address"
                                offset: -80
                            direction: 3
                        }
                        {
                            type: "LaneAccess"
                            id: 16
                            device: 9
                            lane: 6
                            x:
                                obj: 2
                                prop: "value"
                            y:
                                obj: 2
                                prop: "value"
                                offset: 60
                            direction: 1
                        }
                        {
                            type: "LaneWriteOnlyAccess"
                            id: 18
                            device: 11
                            lane: 5
                            x:
                                obj: 3
                                prop: "address"
                            y:
                                obj: 3
                                prop: "address"
                                offset: -80
                            direction: 3
                        }
                        {
                            type: "LaneReadOnlyAccess"
                            id: 19
                            device: 12
                            lane: 6
                            x: obj: 3
                            y:
                                obj: 3
                                offset: 72
                            direction: 1
                            alwayson: false
                        }
                        {
                            type: "LaneAccess"
                            id: 20
                            device: 13
                            lane: 6
                            x: obj: 4
                            y:
                                obj: 4
                                offset: -80
                            direction: 3
                        }
                        {
                            type: "One"
                            id: 26
                            output: 22
                            x: 520
                            y: 100
                        }
                        {
                            type: "One"
                            id: 27
                            output: 24
                            x: 520
                            y: obj: 1
                        }
                        {
                            type: "EqualsZero"
                            id: 28
                            input: 6
                            output: 21
                            x: 460
                            y: 175
                        }
                        {
                            type: "And"
                            id: 29
                            input1: 21
                            input2: 22
                            output: 23
                            x: 460
                            y: 100
                        }
                        {
                            type: "Or"
                            id: 30
                            input1: 23
                            input2: 24
                            output: 25
                            x: 460
                            y: obj: 1
                        }
                    ]
                    keyboardBindings:
                        "1":
                            obj: 14
                            on: "read"
                            off: "unRead"
                        "2":
                            obj: 14
                            on: "write"
                            off: "unWrite"
                        "3":
                            obj: 16
                            on: "read"
                            off: "unRead"
                        "4":
                            obj: 16
                            on: "write"
                            off: "unWrite"
                        "5":
                            obj: 18
                            on: "read"
                            off: "unRead"
                        "6":
                            obj: 18
                            on: "write"
                            off: "unWrite"
                        "7":
                            obj: 20
                            on: "read"
                            off: "unRead"
                        "8":
                            obj: 20
                            on: "write"
                            off: "unWrite"
                        "9":
                            obj: 4
                            on: "onAdd"
                            off: "offAdd"
                        "a":
                            obj: 4
                            on: "onSub"
                            off: "offSub"
                        "b":
                            obj: 26
                            on: "write"
                            off: "unWrite"
                        "c":
                            obj: 27
                            on: "write"
                            off: "unWrite"
                        "d":
                            obj: 19
                            on: "read"
                            off: "unRead"
            }[id]