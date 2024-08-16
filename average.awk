#! /usr/bin/awk -f

# dry-run
# self-ipi
# normal-ipi
# broadcast-ipi
# broadcast-lock
BEGIN {
    SUM[0]=0;
    SUM[1]=0;
    SUM[2]=0;
    SUM[3]=0;
    TOTAL[0]=0;
    TOTAL[1]=0;
    TOTAL[2]=0;
    TOTAL[3]=0;
    COUNT=0;
}


/Normal-IPI:/{
    SUM[0]+=$2;
    TOTAL[0]+=$4;
    COUNT++;
}

/THIS_MODULE-IPI:/{
    SUM[1]+=$2;
    TOTAL[1]+=$4;
}

/THIS_SOCKET-IPI:/{
    SUM[2]+=$2;
    TOTAL[2]+=$4;
}

/ANOTHER_SOCKET-IPI:/{
    SUM[3]+=$2;
    TOTAL[3]+=$4;
}

/Self-IPI:/{
    SUM[4]+=$2;
    TOTAL[4]+=$4;
}

END {
    printf("count = %d\n", COUNT);
    fmt="%s\t%12.0f\t\n";
    printf(fmt, "Self\t\t", SUM[4]/COUNT);
    printf(fmt, "Normal\t\t", SUM[0]/COUNT);
    printf(fmt, "THIS_MODULE IPI\t", SUM[1]/COUNT);
    printf(fmt, "THIS_SOCKET IPI\t", SUM[2]/COUNT);
    printf(fmt, "ANOTHER_SOCKET IPI", SUM[3]/COUNT);
}

