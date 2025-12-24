class Solution(object):
    def isPalindrome(self, x):
        if x<0:
            return False
        y1=str(x)
        return y1==y1[::-1]
        """
        :type x: int
        :rtype: bool
        """
        