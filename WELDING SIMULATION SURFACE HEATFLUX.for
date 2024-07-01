      SUBROUTINE DFLUX(FLUX, SOL, KSTEP, KINC, TIME, NOEL, NPT, COORDS,
     &            JLTYP, TEMP, PRESS, SNAME)
C
      INCLUDE 'ABA_PARAM.INC'
      DIMENSION FLUX(2), TIME(2), COORDS(3)
      CHARACTER*80 SNAME
C
      X = COORDS(1)
      Y = COORDS(2)
      Z = COORDS(3)

      Xstart = 0.0
      Ystart = 0.0
      Zstart = 0.0


      vx = 0.001
      vy = 0.0
      vz = 0.0

      Xcentre = Xstart + vx * TIME(2)
      Ycentre = Ystart
      Zcentre = Zstart

      XT = Xcentre - X
      YT = Ycentre - Y
      Dist = SQRT((YT*YT) + (XT*XT))

      voltage = 11
      current = 80
      etaeff = 0.48
      rh = 0.003

      FLUX(1) = ((etaeff * voltage * current) / (3.141592654 * rh**2.))* EXP(-(Dist**2) / (rh**2))

      RETURN
      END