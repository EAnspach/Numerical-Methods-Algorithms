function[L, U, P] = luFactor(A)
%% Help
%{
This algorithm takes an input of a square matrix and performs LU
decomposition on that matrix and outputs the upper tringular matrix (U),
the lower triangular matrix (L), and the pivot matrix (P)
Created by Ethan Anspach
3/24/18
%}

%% Declare Variables
s = size(A);%size of the input matrix, used for logic in the elimination process
P = eye(s); % Pivot matrix, starts out as an identity matrix with the same dimensions as A
U = A;      % Upper triangular matrix, starts out as a copy of A
L = eye(s); % Lower triangular matrix, starts out as an identity matrix with the same dimensions as A
elimFact = 0; %Factor used to eliminate variables during gauss elimination
elimVect = [0 0 0]; %Vector that is used to subtract from rows of the input matrix during gauss elimination
max=abs(U(1,1)); %maximum value in the current column
maxRow = 1; %Number that corresponds to the row that contains the maxiumum value used for pivoting
pivot = 0; %Boolean variable that is zero when no pivot is needed and 1 when a pivot is needed
%% Catch Errors
if isempty(A) || nargin ~= 1
    error('This function requires an imput of one square matrix')
end

if s(1,2) ~= s(1,1) || s(1,1) == 1
    error('You must input a square matrix for LU factorization')
end
%% Pivot Matrix
for i = 1:(s(1,1)-1)
    %reseting variables
    max = abs(U(i,i));
    maxRow = i;
    pivot = 0;
    for k = 1:(s(1,1)-1)%This loop determines if pivoting is needed and what rows to pivot
        if abs(U(k+1,i)) > max
            max = abs(U(k+1,i));
            maxRow = k+1;
            pivot = 1;
        end
    end
    
    if pivot == 1
        %Pivoting the rows of the U matrix
        U([i maxRow],:) = U([maxRow i],:);
        P([i maxRow],:) = P([maxRow i],:);
            if i > 1
                %pivoting the L matrix
                x = L(i,i-1);
                L(i,i-1)  = L(i+1,i-1);
                L(i+1,i-1) = x;
            end
    end
%% Eliminate variables
        for j = 1:(s(1,1)-i)
        %Implements the elimination process of gauss elimination
        elimFact = (U(i+j,i)/U(i,i)); %Calculates the factor that will eliminate the variable
        L(i+j,i) = elimFact; %Stores the elimination factor in the L matrix
        elimVect = elimFact*U(i,:); %Creates a vector that when subtracted 
        %from the appropriate row, will eliminate a variable from that row in the U matrix
        U(i+j,:) = U(i+j,:)-elimVect; %eliminates a variable in the U matrix
        end
end
%% Print Results
fprintf('The resulting pivot matrix is:\n')
disp(P)
fprintf('The resulting lower triangular matrix is:\n')
disp(L)
fprintf('The resulting upper triangular matrix is: \n')
disp(U)
fprintf('L*U =\n')
disp(L*U)
fprintf('A =\n')
disp(A)
fprintf('A*P =\n')
disp(P*A)
fprintf('Showing that L*U = A*P')