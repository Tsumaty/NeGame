function mapValue(val, curLower, curUpper, desLower, desUpper)
{
    return (((val - curLower) / (curUpper - curLower)) * (desUpper - desLower)) + desLower;
}