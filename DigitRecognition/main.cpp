#include <stdlib.h>
#include <vector>
#include <cmath>
#include <opencv2/opencv.hpp>
#include <iostream>
void printVector(const std::vector<double>& vec) {
    for (const auto& it : vec)
        std::cout << it << " ";
    std::cout << std::endl;
}

double sigmoid(double x) {
    return 1 / (1 + exp(-x));
}

double sigmoidDerivative(double x) {
    return sigmoid(x) * (1 - sigmoid(x));
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
    void print_output() {
        for (const auto& it : outputLayer)
            std::cout << it << " ";
    }

    void backPropagation(const std::vector<double>& target) {
        std::vector<double> outputLayerGradient(outputLayer.size());
        for (std::size_t i = 0; i < outputLayer.size(); ++i)
            outputLayerGradient[i] = (target[i] - outputLayer[i]);

        std::vector<double> hiddenLayerGradient(hiddenLayer.size());
        for (std::size_t i = 0; i < hiddenLayerGradient.size(); ++i) {
            double sumError = 0.0;
            for (std::size_t j = 0; j < outputLayerGradient.size(); ++j)
                sumError += outputLayerGradient[j] * outputLayerWeights[j + i * outputLayerGradient.size()];
            hiddenLayerGradient[i] = sumError;
        }

        for (int i = 0; i < hiddenLayer.size(); ++i) {
            for (int j = 0; j < outputLayer.size(); ++j) {
                outputLayerWeights[j + i * outputLayer.size()] += learningRate * outputLayerGradient[j] * hiddenLayer[i];
            }
        }

        for (int i = 0; i < inputLayer.size(); ++i) {
            for (int j = 0; j < hiddenLayer.size(); ++j) {
                hiddenLayerWeights[j + i * hiddenLayer.size()] += learningRate * hiddenLayerGradient[j] * inputLayer[i];
            }
        }
    }

private:
    std::vector<double> inputLayer;
    std::vector<double> hiddenLayer;
    std::vector<double> outputLayer;
    std::vector<double> hiddenLayerWeights;
    std::vector<double> outputLayerWeights;
    double learningRate;
};



std::vector<double> preprocessImage(const cv::Mat& image) {
    cv::Mat resizedImage;
    cv::resize(image, resizedImage, cv::Size(14, 14));
    cv::Mat normalizedImage;
    resizedImage.convertTo(normalizedImage, CV_32F, 1.0 / 255.0);
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
    cv::Mat image = cv::imread("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/DigitRecognition/photo/mnist_first_digit.png", cv::IMREAD_GRAYSCALE);

    if (image.empty()) {
        std::cout << "Failed to load image." << std::endl;
        return -1;
    }

    const std::vector<double> input = preprocessImage(image);
    neuralNetwork net(784, 128, 10, 0.1);
    std::vector<double> target = {0, 0, 0, 0, 0, 1, 0, 0, 0, 0};
    for (int i = 0; i < 100; i++) {
        net.forwardPropagation(input);
        net.backPropagation(target);
    }
    net.print_output();
    return 0;
}






