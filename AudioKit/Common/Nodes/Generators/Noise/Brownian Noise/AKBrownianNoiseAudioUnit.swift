// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AVFoundation

public class AKBrownianNoiseAudioUnit: AKAudioUnitBase {

    let amplitude = AUParameter(
        identifier: "amplitude",
        name: "Amplitude",
        address: AKBrownianNoiseParameter.amplitude.rawValue,
        range: AKBrownianNoise.amplitudeRange,
        unit: .generic,
        flags: .default)

    public override func createDSP() -> AKDSPRef {
        return createBrownianNoiseDSP()
    }

    public override init(componentDescription: AudioComponentDescription,
                         options: AudioComponentInstantiationOptions = []) throws {
        try super.init(componentDescription: componentDescription, options: options)

        parameterTree = AUParameterTree.createTree(withChildren: [amplitude])
    }
}
