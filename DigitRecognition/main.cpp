#include <stdlib.h>
#include <vector>
#include <cmath>
#include <opencv2/opencv.hpp>
#include <iostream>
#include <fstream>


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
                sum += inputLayer[j] * hiddenLayerWeights[i + j * hiddenLayer.size()];
            }
            hiddenLayer[i] = sigmoid(sum);
        }

        for (std::size_t i = 0; i < outputLayer.size(); ++i) {
            double sum = 0.0;
            for (std::size_t j = 0; j < hiddenLayer.size(); ++j) {
                sum += hiddenLayer[j] * outputLayerWeights[i + j * outputLayer.size()];
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
            outputLayerGradient[i] = (target[i] - outputLayer[i]) * sigmoidDerivative(outputLayer[i]);

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

std::vector<std::vector<double>> preprocess(std::string imagesFilePath) {
    std::ifstream imagesFile(imagesFilePath, std::ios::binary);

    if (!imagesFile) {
        throw std::invalid_argument("Failed to open images file.");;
    }

    int numImages = 0;
    int imageRows = 0;
    int imageCols = 0;

    imagesFile.read(reinterpret_cast<char*>(&numImages), 4);
    imagesFile.read(reinterpret_cast<char*>(&imageRows), 4);
    imagesFile.read(reinterpret_cast<char*>(&imageCols), 4);

    numImages = ntohl(numImages);
    imageRows = ntohl(imageRows);
    imageCols = ntohl(imageCols);

    std::vector<std::vector<double>> images;
    images.reserve(numImages);

    for (int i = 0; i < numImages; ++i) {
        cv::Mat image(imageRows, imageCols, CV_8UC1);

        imagesFile.read(reinterpret_cast<char*>(image.data), imageRows * imageCols);

        cv::resize(image, image, cv::Size(28, 28));

        if (image.empty()) {
            std::cout << "Failed to resize the image." << std::endl;
            continue;
        }

        std::vector<double> imageVec(image.rows * image.cols);
        for (int r = 0; r < image.rows; ++r) {
            for (int c = 0; c < image.cols; ++c) {
                imageVec[r * image.cols + c] = static_cast<double>(image.at<uchar>(r, c)) / 255.0;
            }
        }

        images.push_back(imageVec);
    }

    imagesFile.close();

    return images;
}


std::vector<std::vector<double>> createLabels(std::string labelsFilePath) {

    std::ifstream labelsFile(labelsFilePath, std::ios::binary);

    if (!labelsFile) {
        throw std::invalid_argument("Failed to open labelsFIle");
    }

    int numLabels = 0;

    labelsFile.read(reinterpret_cast<char*>(&numLabels), 4);

    numLabels = ntohl(numLabels);

    std::vector<std::vector<double>> targetOutputs;
    targetOutputs.reserve(numLabels);

    for (int i = 0; i < numLabels; ++i) {
        unsigned char label = 0;
        labelsFile.read(reinterpret_cast<char*>(&label), 1);


        std::vector<double> targetOutput(10, 0.0);

        targetOutput[label] = 1.0;

        targetOutputs.push_back(targetOutput);
    }

    labelsFile.close();

    return targetOutputs;
}

int main() {
    std::vector<std::vector<double>> inputs = preprocess("/Users/lusterclaws/Desktop/train-images-idx3-ubyte");
    std::vector<std::vector<double>> targets = createLabels("/Users/lusterclaws/Desktop/train-labels-idx1-ubyte");
    neuralNetwork net(784, 128, 10, 0.1);
    for (std::size_t numEpochs = 0; numEpochs < 10; ++numEpochs) {
        for (std::size_t i = 0; i < 100; i++) {
            net.forwardPropagation(inputs[i]);
            net.backPropagation(targets[i]);
        }
    }
    net.forwardPropagation(inputs[105]);
    net.print_output();
    printVector(targets[105]);
    return 0;
}






