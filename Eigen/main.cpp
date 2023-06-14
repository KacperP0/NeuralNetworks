#include <iostream>
#include "eigen.hpp"
double func(Eigen::Matrix param);

int main() {
    Eigen::Matrix param(2, 2);
    Eigen::optimize(param, func, 0.001).print_matrix();

    return 0;
}

double func(Eigen::Matrix param) {
    double x = param[0][1];
    double y = param[0][0];
    return ((x - 1) * (x - 1) * (y - 1) * (y - 1)) + (x * x);
}