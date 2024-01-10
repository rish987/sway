wlr-randr --output $(wlr-randr | grep -Pom1 '\w*DP-\d' | head -1) --$1
