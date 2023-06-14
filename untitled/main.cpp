#include <stdlib.h>
#include <vector>
#include <cmath>

double sigmoid(double x) {
    return 1 / (1 + exp(-x));
}

double sigmoidDerivative(double x) {
    return x * (1 - x);
}

class neuralNetwork {
public:
    neuralNetwork(int inputSize, int hiddenSize, int outputSize, double learningRate) {
        inputLayer.resize(inputSize);
        hiddenLayer.resize(hiddenSize);
        outputLayer.resize(outputSize);
        hiddenLayerWeights.resize(inputSize * hiddenSize);
        outputLayerWeights.resize(hiddenSize * outputSize);
        this->learningRate = learningRate;
        initializeWeights();
    }

    void initializeWeights() {
        // Initialize weights randomly between -1 and 1
        for (int i = 0; i < hiddenLayerWeights.size(); ++i) {
            hiddenLayerWeights[i] = ((double) rand() / RAND_MAX) * 2 - 1;
        }

        for (int i = 0; i < outputLayerWeights.size(); ++i) {
            outputLayerWeights[i] = ((double) rand() / RAND_MAX) * 2 - 1;
        }
    }

    void forwardPropagation(const std::vector<double>& input) {
        inputLayer = input;
        for (std::size_t i = 0; i < hiddenLayer.size(); ++i) {
            double sum = 0.0;
            for (std::size_t j = 0; j < inputLayer.size(); ++j) {
                sum += inputLayer[j] * hiddenLayerWeights[j + i * hiddenLayer.size()];
            }
            hiddenLayer[i] = sigmoid(sum);
        }

        for (std::size_t i = 0; i < outputLayer.size(); ++i) {
            double sum = 0.0;
            for (std::size_t j = 0; j < hiddenLayer.size(); ++j) {
                sum += hiddenLayer[j] * outputLayerWeights[j + i * outputLayer.size()];
            }
            outputLayer[i] = sigmoid(sum);
        }
    }
    double cost(const std::vector<std::vector<double>>& target, const std::vector<std::vector<double>>& input) {
        double sum = 0;
        int n = target.size();
        for (std::size_t i = 0; i < n; ++i) {
            forwardPropagation(input[i]);
            double norm = 0;
            for (std::size_t j = 0; j < target[i].size(); ++j)
                norm += pow(target[i][j] - outputLayer[j], 2);
            sum += norm;
        }
        return sum / (2 * n);
    }




private:
    std::vector<double> inputLayer;
    std::vector<double> hiddenLayer;
    std::vector<double> outputLayer;
    std::vector<double> hiddenLayerWeights;
    std::vector<double> outputLayerWeights;
    double learningRate;
};

#include "include/opencv2/opencv.hpp"
#include <iostream>
#include <vector>

std::vector<double> preprocessImage(const cv::Mat& image) {
    // Resize the image to a fixed size
    cv::Mat resizedImage;
    cv::resize(image, resizedImage, cv::Size(28, 28));

    // Normalize the pixel values to the range [0, 1]
    cv::Mat normalizedImage;
    resizedImage.convertTo(normalizedImage, CV_32F, 1.0 / 255.0);

    // Flatten the image into a 1D vector
    std::vector<double> flattenedImage;
    if (normalizedImage.isContinuous()) {
        flattenedImage.assign(normalizedImage.datastart, normalizedImage.dataend);
    } else {
        for (int i = 0; i < normalizedImage.rows; ++i) {
            flattenedImage.insert(flattenedImage.end(), normalizedImage.ptr<float>(i), normalizedImage.ptr<float>(i) + normalizedImage.cols);
        }
    }

    return flattenedImage;
}

int main() {
    // Read the handwritten digit image
    cv::Mat image = cv::imread("handwritten_digit.png", cv::IMREAD_GRAYSCALE);

    // Check if the image was loaded successfully
    if (image.empty()) {
        std::cout << "Failed to load image." << std::endl;
        return -1;
    }

    // Preprocess the image for neural network input
    std::vector<double> input = preprocessImage(image);

    // Print the preprocessed image values (for verification)
    for (const auto& pixel : input) {
        std::cout << pixel << " ";
    }
    std::cout << std::endl;

    return 0;
}






