#ifndef EIGEN_EIGEN_HPP
#define EIGEN_EIGEN_HPP
#include <vector>
namespace Eigen {
    class Matrix {
    public:
        Matrix() = default;

        Matrix(std::vector<std::vector<double>> Matrix) : matrix_(Matrix) {}

        Matrix(std::size_t n);

        Matrix(std::size_t n, std::size_t m);

        Matrix(std::size_t n, std::size_t m, double val);

        [[maybe_unused]] Matrix(std::vector<double> diag);

        void add_row(const std::vector<double> vect) {matrix_.push_back(vect);}

        [[maybe_unused]] void add_column(const std::vector<double>& vect);

        [[maybe_unused]] void print_matrix();

        void push_back(std::vector<double>& vec) {matrix_.push_back(vec);}

        [[maybe_unused]] Matrix add_matrix(const Matrix& mat);

        [[maybe_unused]] Matrix sub_matrix(Matrix mat);

        Matrix transpose() const;

        Matrix multiply_matrix(Matrix& mat);

        [[maybe_unused]] Matrix multiply_matrix(double num);

        std::vector<double> multiply_matrix(std::vector<double>& vec);

        std::size_t size() const {return matrix_.size();}

        void empty() {matrix_.clear();}

        std::vector<double> &operator[](std::size_t i) { return matrix_[i]; }

        std::vector<std::vector<double>>::iterator begin() { return matrix_.begin(); }

        std::vector<std::vector<double>>::iterator end() { return matrix_.end(); }

        std::vector<std::vector<double>>::const_iterator cbegin() const { return matrix_.cbegin(); }

        std::vector<std::vector<double>>::const_iterator cend() const { return matrix_.cend(); }

        std::vector<std::vector<double>>::const_iterator begin() const { return matrix_.begin(); }

        std::vector<std::vector<double>>::const_iterator end() const { return matrix_.end(); }
    private:
        std::vector<std::vector<double>> matrix_;
    };

    std::vector<double> add_vector(const std::vector<double> &vec1,const std::vector<double> &vec2);
    std::vector<double> sub_vector(const std::vector<double> &vec1,const std::vector<double> &vec2);
    void print_vector(const std::vector<double>& vec);
    double norm(std::vector<double> &vec);
    std::vector<double> multiply_by_scalar(const std::vector<double>& vec, double num);
    bool check_statement(const std::vector<double>& vec_diff, double eps);
    double multiply_by_vector(const std::vector<double>& vec1,const std::vector<double>& vec2);
    Matrix deflation(Matrix matrix, double eigenvalue, const std::vector<double>& eigenvector);
    std::vector<double> abs(std::vector<double>& vec);
    Matrix optimize(Matrix& parameters, std::function<double(Eigen::Matrix)> func, const double eps);
    Matrix grad(Matrix& parameters, std::function<double(Eigen::Matrix)> func, const double eps);



    class Polynominal {
    public:
        Polynominal(std::vector<double> Frequencies) : frequencies_(Frequencies) {}

        std::vector<double> show_freq() const {return frequencies_;}

        Matrix companion_matrix();

        std::vector<double> zeros();

    private:
        std::vector<double> frequencies_;
    };

    double norm(Matrix &mat);
}

std::vector<double> multiply_by_scalar(std::vector<double> vec, double num);

class NeuralNet {
    NeuralNet(Eigen::Matrix weights, Eigen::Matrix biases)
};
#endif
