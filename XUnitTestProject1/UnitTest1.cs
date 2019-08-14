using System;
using Xunit;

namespace XUnitTestProject1
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            int a = 9;
            Assert.Equal(9, a);

        }
    }
}
