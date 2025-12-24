class Solution(object):
    def plusOne(self, digits):
        num=0
        for d in digits:
            num=num*10+d
        num=num+1
        result=[]
        for i in str(num):
            result.append(int(i))
        return result

        """
        :type digits: List[int]
        :rtype: List[int]
        """
        