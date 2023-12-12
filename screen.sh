wlr-randr --output $(wlr-randr | grep -Pom1 'DP-\d' | head -1) --$1
