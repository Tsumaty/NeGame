// функция принимает название звука в формате "snd<Name>" и
// номер звука sndNum (от 1 до sndMaxNum)
// и возвращает новый номер звука
function playSnd(sndName, sndNum, sndMaxNum)
{
    if (sndMaxNum < 1) return sndNum;
    
    sndName = sndName + string(sndNum);
    var sndIndex = asset_get_index(sndName);
    if (sndIndex != -1)
    {
        var startNum = sndNum;
        audio_play_sound(sndIndex, 1, false);
        while (sndNum == startNum)
            sndNum = irandom_range(1, sndMaxNum);
    }
    return sndNum;
}