/**
@func                       playSound(sndName, [sndNum], [sndMaxNum], [stopPlaying], [sndMinNum])
@desc                       Функция воспроизводит звук из набора
@param {String} sndName     Название звука без цифры
@param {Real} [sndNum]      Текущий номер звука
@param {Real} [sndMaxNum]   Максимальный номер звука (по умолчанию 1)
@param {Bool} [stopPlaying] Нужно ли прерывать звуки этой группы
@param {Real} [sndMinNum]   Минимальный номер звука (по умолчанию 1)
@return {Real}              Возвращает случайный номер из диапазона
*/
function playSound(sndName, sndNum=1, sndMaxNum=1/*, stopPlaying=false*/, sndMinNum=1)
{
    if (sndMaxNum < 1) return sndNum;
    
    var sndIndex = asset_get_index(sndName + string(sndNum));
    if (sndIndex != -1)
    {
        /*
        if (stopPlaying)
        {
            var num = sndMinNum;
            var index = asset_get_index(sndName + string(num));
            while (index != -1 && num <= sndMaxNum)
            {
                index = asset_get_index(sndName + string(num++));
                audio_stop_sound(index);
            }
        }
        */
        if (sndMaxNum == 1 && sndMinNum == 1)
        {
            audio_play_sound(sndIndex, 1, false);
            return sndNum;
        }
        
        audio_play_sound(sndIndex, 1, false);
        var startNum = sndNum;
        while (sndNum == startNum) // звуки не повторяются два раза подряд
            sndNum = irandom_range(sndMinNum, sndMaxNum);
    }
    
    return sndNum;
}