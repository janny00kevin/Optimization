% A script to test your fcn_checker(x, y)
% There are a few test cases, you need to obtain a PASS on all of them

load baseline;
load in_data;
test_cases = size(baseline, 2);
pass = zeros(1, test_cases);
your_ans = fcn_checker(x, y);

for i=1: test_cases
    testcase_string= ['Testcase ', num2str(i)];
    if(sum(baseline(:, i)==your_ans(:, i))==6)
       pass(i) = 1;
       
    end
    if pass(i)
        testcase_string = [testcase_string, ' PASS'];    
    else 
        testcase_string = [testcase_string, ' FAIL'];
    end
    disp(testcase_string);
end

if sum(pass==1)==test_cases
    
    disp(['You have PASSED all the testcases, congratz!']);
else
    disp(['Some testcases have FAILED, try again']);
end