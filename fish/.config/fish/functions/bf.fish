function bf
    sudo sh -c "f=/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode; \
                           v=\$(cat \$f); \
                           nv=\$((1-v)); \
                           echo \$nv > \$f && \
                           echo Battery conservation: \$nv \(0=full 1=~80%\)"
end
