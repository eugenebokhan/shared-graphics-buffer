import Foundation
import CoreVideoTools
import CoreVideo
import MetalTools
import CoreML
import Accelerate

public enum GraphicsDataProviderError: Error {
    case missingData
    case missingDataOfPlane(Int)
}

public protocol GraphicsDataProvider {
    func graphicsData() throws -> GraphicsData
}

public extension GraphicsDataProvider {
    func vImageBuffer() throws -> vImage_Buffer {
        return try self.graphicsData().vImageBuffer()
    }
    
    func cvPixelBuffer(cvPixelFormat: CVPixelFormat) throws -> CVPixelBuffer {
        return try self.graphicsData().cvPixelBuffer(cvPixelFormat: cvPixelFormat)
    }
    
    @available(iOS 14.0, macCatalyst 14.0, *)
    func mlMultiArray(
        shape: [Int],
        dataType: MLMultiArrayDataType
    ) throws -> MLMultiArray {
        return try self.graphicsData().mlMultiArray(
            shape: shape,
            dataType: dataType
        )
    }
    
    @available(iOS 14.0, macCatalyst 14.0, *)
    func mlMultiArray(
        shape: [Int],
        strides: [Int],
        dataType: MLMultiArrayDataType
    ) throws -> MLMultiArray {
        return try self.graphicsData().mlMultiArray(
            shape: shape,
            strides: strides,
            dataType: dataType
        )
    }
    
    func mtlBuffer(device: MTLDevice) throws -> MTLBuffer {
        return try self.graphicsData().mtlBuffer(device: device)
    }
    
    func mtlTexture(
        device: MTLDevice,
        pixelFormat: MTLPixelFormat,
        usage: MTLTextureUsage = []
    ) throws -> MTLTexture {
        return try self.graphicsData().mtlTexture(
            device: device,
            pixelFormat: pixelFormat,
            usage: usage
        )
    }
}
