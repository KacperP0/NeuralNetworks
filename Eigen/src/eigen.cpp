#include "eigen.hpp"
#include <iostream>
#include <iomanip>
#include <algorithm>
#include <numeric>
#include <vector>
std::vector<double> Eigen::abs(std::vector<double>& vec) {
    std::vector<double> ret_vec;
    for (const auto& it : vec) {
        if (it < 0)
            ret_vec.push_back(-it);
        else
            ret_vec.push_back(it);
    }
    return ret_vec;
}

Eigen::Matrix Eigen::deflation(Matrix matrix, double eigenvalue, const std::vector<double>& eigenvector) {
    std::size_t n = matrix.size();
    Matrix deflatedMatrix(n);

    Matrix V(n);
    for (std::size_t i = 0; i < n; i++) {
        for (std::size_t j = 0; j < n; j++) {
            V[i][j] = eigenvector[i] * eigenvector[j];
        }
    }

    for (std::size_t i = 0; i < n; i++) {
        for (std::size_t j = 0; j < n; j++) {
            deflatedMatrix[i][j] = matrix[i][j] - eigenvalue * V[i][j];
        }
    }

    return deflatedMatrix;
}

Eigen::Matrix::Matrix(std::size_t n) {
    for (std::size_t i = 0; i < n; i++) {
        matrix_.emplace_back();
        for (std::size_t j = 0; j < n; j++)
            matrix_[i].push_back(0);
    }
}

Eigen::Matrix::Matrix(std::size_t n, std::size_t m) {
    for (std::size_t i = 0; i < n; i++) {
        matrix_.emplace_back();
        for (std::size_t j = 0; j < m; j++)
            matrix_[i].push_back(0);
    }
}


[[maybe_unused]] void Eigen::Matrix::add_column(const std::vector<double>& vect) {
    if (matrix_.empty())
        for (std::size_t i = 0; i < vect.size(); i++)
            matrix_.emplace_back();
    else if (matrix_.size() != vect.size())
        throw std::invalid_argument("Matrix dimension different from vector size.");
    for (std::size_t i = 0; i < vect.size(); i++)
        matrix_[i].push_back(vect[i]);
}

[[maybe_unused]] Eigen::Matrix::Matrix(std::vector<double> diag) : Matrix(diag.size()) {
    for (std::size_t i = 0; i < diag.size(); i++)
        matrix_[i][i] = diag[i];
}

[[maybe_unused]] void Eigen::Matrix::print_matrix() {
    for (const auto& i : matrix_) {
        for (const auto& j : i) {
            std::cout << std::fixed << std::setprecision(5) << std::setw(10) << std::setfill(' ') << j << " ";
        }
        std::cout << std::endl;
    }
}
std::vector<double> Eigen::add_vector(const std::vector<double>& vec1, const std::vector<double>& vec2) {
    std::vector<double> ret_vec;
    std::transform(vec1.cbegin(), vec1.cend(), vec2.cbegin(), std::back_inserter(ret_vec), std::plus<>());
    return ret_vec;
}

std::vector<double> Eigen::sub_vector(const std::vector<double>& vec1, const std::vector<double>& vec2) {
    std::vector<double> ret_vec;
    std::transform(vec1.cbegin(), vec1.cend(), vec2.cbegin(), std::back_inserter(ret_vec), std::minus<>());
    return ret_vec;
}

void Eigen::print_vector(const std::vector<double> &vec) {
    for (const auto& it : vec)
        std::cout << it << " ";
    std::cout << std::endl;
}

double Eigen::norm(std::vector<double> &vec) {
    return double(sqrt(std::accumulate(vec.cbegin(), vec.cend(), 0.0, [](double sum, double elem) {
        sum += elem * elem;
        return sum;
    })));
}

double Eigen::norm(Matrix &mat) {
    double sum = 0;

    for (std::size_t i = 0; i < mat.size(); i++)
        for (std::size_t j = 0; j < mat[0].size(); j++) {
            sum += (mat[i][j] * mat[i][j]);
        }
    return sqrt(sum);
}

std::vector<double> Eigen::multiply_by_scalar(const std::vector<double>& vec, double num) {
    std::vector<double> ret_vec;
    for (const auto& it : vec)
        ret_vec.push_back(it * num);
    return ret_vec;
}

bool Eigen::check_statement(const std::vector<double> &vec_diff, double eps = 0.000000000000001) {
    for (const auto& it : vec_diff)
        if (std::abs(it) > eps)
            return true;
    return false;
}

double Eigen::multiply_by_vector(const std::vector<double> &vec1, const std::vector<double> &vec2) {
    double ret_val = 0;
    for (std::size_t i = 0; i < vec1.size(); i++)
        ret_val += vec1[i] * vec2[i];
    return ret_val;
}


Eigen::Matrix
Eigen::grad(Eigen::Matrix &parameters, std::function<double(Eigen::Matrix)> func, const double eps) {
    Matrix mat_grad(parameters.size(), parameters[0].size());
    for (std::size_t i = 0 ; i < mat_grad.size(); i++)
        for (std::size_t j = 0; j < mat_grad[0].size(); ++j) {
            Matrix parameters_p = parameters;
            parameters[i][j] += eps;
            mat_grad[i][j] = (func(parameters) - func(parameters_p)) / eps;
            parameters[i][j] -= eps;
        }
    return mat_grad;
}

Eigen::Matrix Eigen::optimize(Eigen::Matrix& parameters, std::function<double(Eigen::Matrix)> func, double eps = 0.001) {
    Matrix gradient = grad(parameters, func, eps);
    Matrix eps_matrix(parameters.size(), parameters[0].size(), eps);
    gradient.print_matrix();
    int counter = 0;
    double h = eps;
    while (norm(gradient) > h) {
        parameters = parameters.sub_matrix(gradient.multiply_matrix(norm(eps_matrix) / norm(gradient)));
        gradient = grad(parameters, func, eps);
        if (counter == 10000)
            h *= 10;
        counter++;
    }
    return parameters;
}


[[maybe_unused]] Eigen::Matrix Eigen::Matrix::add_matrix(const Matrix &mat) {
    Matrix ret_mat(mat.size());
    std::transform(matrix_.cbegin(), matrix_.cend(), mat.cbegin(), ret_mat.begin(), add_vector);
    return ret_mat;
}

[[maybe_unused]] Eigen::Matrix Eigen::Matrix::sub_matrix(Matrix mat) {
    Matrix ret_mat(mat.size(), mat[0].size());
    std::transform(matrix_.cbegin(), matrix_.cend(), mat.cbegin(), ret_mat.begin(), sub_vector);
    return ret_mat;
}

Eigen::Matrix Eigen::Matrix::transpose() const {
    Matrix transposed;
    for (std::size_t i = 0; i < matrix_.size(); i++) {
        std::vector<double> vec_t{};
        for (std::size_t j = 0; j < matrix_[0].size(); j++) {
            vec_t.push_back(matrix_[j][i]);
        }
        transposed.push_back(vec_t);
    }
    return transposed;
}

Eigen::Matrix Eigen::Matrix::multiply_matrix(Matrix& mat) {
    Matrix ret_mat(matrix_.size(), mat[0].size());
    for (std::size_t i = 0; i < matrix_.size(); i++)
        for (std::size_t j = 0; j < matrix_[0].size(); j++) {
            double sum = 0;
            for (std::size_t it = 0; it < matrix_[0].size(); it++)
                sum += (matrix_[i][it] * mat[it][j]);
            ret_mat[i][j] = sum;
        }
    return ret_mat;
}

[[maybe_unused]] Eigen::Matrix Eigen::Matrix::multiply_matrix(double num) {
    Matrix ret_mat(matrix_.size(), matrix_[0].size());
    for (std::size_t i = 0; i < matrix_.size(); i++)
        for (std::size_t j = 0; j < matrix_[0].size(); j++)
            ret_mat[i][j] = matrix_[i][j] * num;
    return ret_mat;
}

Eigen::Matrix::Matrix(std::size_t n, std::size_t m, double val) {
    for (std::size_t i = 0; i < n; i++) {
        matrix_.emplace_back();
        for (std::size_t j = 0; j < m; j++)
            matrix_[i].push_back(val);
    }
}

std::vector<double> Eigen::Matrix::multiply_matrix(std::vector<double> &vec) {
    std::vector<double> ret_vec;
    for (auto & i : matrix_) {
        double sum = 0;
        for (std::size_t it = 0; it < vec.size(); it++)
            sum += (i[it] * vec[it]);
        ret_vec.push_back(sum);
    }
    return ret_vec;
}

Eigen::Matrix Eigen::Polynominal::companion_matrix() {
    Matrix ret_mat(frequencies_.size());
    for (std::size_t i = 1; i < ret_mat.size(); i++) {
        ret_mat[i][i - 1] = 1;
        ret_mat[i - 1][ret_mat.size() - 1] = -frequencies_[i - 1];
    }
    ret_mat[ret_mat.size() - 1][ret_mat.size() - 1] = -frequencies_[frequencies_.size() - 1];
    return ret_mat;
}


std::vector<double> Eigen::Polynominal::zeros() {
    std::vector<double> zeros;
    double lambda;
    Polynominal poly(frequencies_);
    Matrix companion = poly.companion_matrix();
    companion.print_matrix();
    std::vector<double> x_w(frequencies_.size(), 1);
    std::vector<double> x_p(frequencies_.size());
    x_w = Eigen::multiply_by_scalar(x_w, 1/ norm(x_w));
    std::vector<double> x_diff = Eigen::add_vector(x_w, x_p);


    int indicate = 0;

    for (std::size_t count = 0; count < 2; count++) {
        int counter = 0;
        while (check_statement(x_diff)) {
            x_p = x_w;
            x_w = companion.multiply_matrix(x_w);
            x_w = Eigen::multiply_by_scalar(x_w, 1 / norm(x_w));
            x_diff = Eigen::sub_vector(Eigen::abs(x_w), Eigen::abs(x_p));
            counter++;
            if (counter == 10000) {
                companion = companion.sub_matrix(Matrix(std::vector<double>(frequencies_.size(), 1)));
                indicate++;
                counter = 0;
                x_w = std::vector<double>(x_w.size(), 1);
                x_w = Eigen::multiply_by_scalar(x_w, 1/ norm(x_w));
                x_p = std::vector<double>(x_p.size());
                }
        }

        lambda = multiply_by_vector(companion.transpose().multiply_matrix(x_w), x_w) / multiply_by_vector(x_w, x_w);
        zeros.push_back(lambda + indicate);
        companion = deflation(companion, lambda + indicate, x_w);
        x_w = std::vector<double>(x_w.size(), 1);
        x_w = Eigen::multiply_by_scalar(x_w, 1/ norm(x_w));
        x_p = std::vector<double>(x_p.size());
        x_diff = sub_vector(x_p, x_w);

        std::cout << indicate;
    }
    return zeros;
}
