class CfgSounds {
    sounds[] = {};
    class SOF_timerBeep {
        name = "SOF_timerBeep";
        sound[] = {QUOTE(PATHTOF(sounds\timerClick.wav)), 1, 3};
        titles[] = {};
    };
    class SOF_timerBeepShort {
        name = "SOF_timerBeepShort";
        sound[] = {QUOTE(PATHTOF(sounds\timerClickShort.wav)), 1, 3};
        titles[] = {};
    };
    class SOF_timerEnd {
        name = "SOF_timerEnd";
        sound[] = {QUOTE(PATHTOF(sounds\timerEnd.wav)), 1, 3};
        titles[] = {};
    };
    class SOF_defused {
        name = "SOF_defused";
        sound[] = {QUOTE(PATHTOF(sounds\defused.wav)), 1, 3};
        titles[] = {};
    };
};