//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_CalPer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Vd29)
	//ARRAY INTEGER(SD_ai_Days;0)
	//ARRAY LONGINT(CAL_al_DiaryDays;0)
	C_BOOLEAN:C305(<>SaturdayoN; <>SundayoN; <>SYS_bo_SDMonoCalendar)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_Datec; $_d_InomingDate; $1; $2; SD_D_CurrentviewDate; vCalF; vCalT)
	C_LONGINT:C283(<>cwSelectColor; <>cwSelectStyle; $_l_BackgroundColour; $_l_CalStartDay; $_l_Colour; $_l_Colour2; $_l_DateIndex; $_l_Day; $_l_ForegroundColour; $_l_WeekIndex; $_l_WeekNumber)
	C_LONGINT:C283(SD3_l_CalendarStartDayNumber)
	C_POINTER:C301($_ptr_Variable; $_ptr_Variable2; $3; $4; $5; $6; $7)
	C_TEXT:C284($_t_BackGroundColour; $_t_ForeGroundColour; $_t_MonthNumberSTR; $_t_oldMethodName; $_t_YearNumberSTR; $0; CAL_t_CalDay; CAL_t_CalMonth; CAL_t_CalYear; SD_t_CalDay; SD_t_CalMonth)
	C_TEXT:C284(SD_t_CalYear; SD_t_Periodstr; vCalMth; vCalPeriod; vCalYr; Vd13; Vd14; Vd20; Vd21; Vd27; Vd28)
	C_TEXT:C284(Vd34; Vd35; Vd6; Vd7; vPeriod; vWeek1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_CalPer")
//Diary_CalPer

If (Count parameters:C259=1)
	If (SD_D_CurrentviewDate=!00-00-00!)
		vCalMth:=String:C10(Month of:C24($1))
		vCalYr:=String:C10(Year of:C25($1))  //Was Substring 3;2
		//vCalPeriod:=vCalYr+"/"+vCalMth
		vCalPeriod:="Yes"
		vCalF:=Date_FromStrs("1"; vCalMth; vCalYr)
		$_t_MonthNumberSTR:=String:C10(Month of:C24(vCalF+37))
		$_t_YearNumberSTR:=String:C10(Year of:C25(vCalF+37))
		vCalT:=Date_FromStrs("1"; $_t_MonthNumberSTR; $_t_YearNumberSTR)-1
		vPeriod:=MonthName($1)+" "+String:C10(Year of:C25($1))
		
		Diary_CalPic
		$_l_Day:=(Day of:C23(<>DB_d_CurrentDate))*Num:C11((Month of:C24(vCalF)=Month of:C24(<>DB_d_CurrentDate)) & (Year of:C25(vCalF)=Year of:C25(<>DB_d_CurrentDate)))
		SD_t_CalDay:=String:C10(Day of:C23($1))
		SD_t_CalMonth:=String:C10(Month of:C24($1))
		SD_t_CalYear:=String:C10(Year of:C25($1))
		SD_D_CurrentviewDate:=$1
		SD_t_Periodstr:=Uppercase:C13(MonthName(SD_D_CurrentviewDate))+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
	Else 
		vCalMth:=String:C10(Month of:C24(SD_D_CurrentviewDate))
		vCalYr:=String:C10(Year of:C25(SD_D_CurrentviewDate))  //Was Substring 3;2
		//vCalPeriod:=vCalYr+"/"+vCalMth
		vCalPeriod:="Yes"
		vCalF:=Date_FromStrs("1"; vCalMth; vCalYr)
		$_t_MonthNumberSTR:=String:C10(Month of:C24(vCalF+37))
		$_t_YearNumberSTR:=String:C10(Year of:C25(vCalF+37))
		vCalT:=Date_FromStrs("1"; $_t_MonthNumberSTR; $_t_YearNumberSTR)-1
		vPeriod:=MonthName(SD_D_CurrentviewDate)+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
		Diary_CalPic
		$_l_Day:=(Day of:C23(<>DB_d_CurrentDate))*Num:C11((Month of:C24(vCalF)=Month of:C24(<>DB_d_CurrentDate)) & (Year of:C25(vCalF)=Year of:C25(<>DB_d_CurrentDate)))
		SD_t_CalDay:=String:C10(Day of:C23(SD_D_CurrentviewDate))
		SD_t_CalMonth:=String:C10(Month of:C24(SD_D_CurrentviewDate))
		SD_t_CalYear:=String:C10(Year of:C25(SD_D_CurrentviewDate))
		SD_t_Periodstr:=Uppercase:C13(MonthName(SD_D_CurrentviewDate))+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
	End if 
	
	$_l_DateIndex:=1
	$_l_WeekIndex:=1
	$_l_WeekNumber:=0
	SD3_l_CalendarStartDayNumber:=Day number:C114(vCalF)-1
	If (SD3_l_CalendarStartDayNumber=0)
		SD3_l_CalendarStartDayNumber:=7
	End if 
	$_l_Day:=1
	While ($_l_DateIndex<38)
		IDLE:C311  // 03/04/03 pb
		$_ptr_Variable:=Get pointer:C304("vD"+String:C10($_l_DateIndex))
		If (($_l_DateIndex>=SD3_l_CalendarStartDayNumber) & ((vCalF+$_l_Day-1)<=vCalT))
			$_ptr_Variable->:=String:C10($_l_Day)
			SD_ai_Days{$_l_DateIndex}:=$_l_Day
			CAL_al_DiaryDays{$_l_DateIndex}:=0
			$_l_Day:=$_l_Day+1
			If (($_l_Day#0) & (<>SYS_bo_SDMonoCalendar=False:C215))
				If (($_l_DateIndex-SD3_l_CalendarStartDayNumber+1)=$_l_Day)
					$_ptr_Variable:=Get pointer:C304("vD"+String:C10($_l_DateIndex))
					//$_l_Colour:=-(<>cwSelectColor+(256*Grey))
					//_O_OBJECT SET COLOR($_ptr_Variable->;$_l_Colour)
					$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
					$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
					OBJECT SET RGB COLORS:C628($_ptr_Variable->; $_t_ForegroundColour; $_t_BackgroundColour)
					
					
					OBJECT SET FONT STYLE:C166($_ptr_Variable->; <>cwSelectStyle)
				Else 
					OBJECT SET FONT STYLE:C166($_ptr_Variable->; 0)
				End if 
			Else 
				//$_l_Colour:=-(15+(256*242))
				//_O_OBJECT SET COLOR($_ptr_Variable->;$_l_Colour)
				OBJECT SET RGB COLORS:C628($_ptr_Variable->; 15; 242)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(15)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(242)
				OBJECT SET RGB COLORS:C628($_ptr_Variable->; $_t_ForegroundColour; $_t_BackgroundColour)
				
				
				OBJECT SET FONT STYLE:C166($_ptr_Variable->; 0)
			End if 
		Else 
			$_ptr_Variable->:=""
			SD_ai_Days{$_l_DateIndex}:=0
		End if 
		If ($_l_Day-1=Num:C11(SD_t_CalDay))
			
			OBJECT SET FONT STYLE:C166($_ptr_Variable->; 1)
			
		End if 
		
		CAL_al_DiaryDays{$_l_DateIndex}:=0
		If (($_l_DateIndex=7) | ($_l_DateIndex=8) | ($_l_DateIndex=15) | ($_l_DateIndex=22) | ($_l_DateIndex=29) | ($_l_DateIndex=36))
			If ($_l_DateIndex=7)
				$_d_Datec:=Date_FromStrs(String:C10(SD_ai_Days{$_l_DateIndex}); vCalMth; vCalYr)
				$_l_WeekNumber:=Abs:C99((((!1995-01-06!-$_d_Datec)/7)-1)+((Num:C11(vCalYr)-1995)*52))
				vWeek1:=String:C10($_l_WeekNumber)
			Else 
				$_l_WeekIndex:=$_l_WeekIndex+1
				$_l_WeekNumber:=$_l_WeekNumber+1
				If ($_l_WeekNumber=53)
					$_l_WeekNumber:=1
				End if 
				$_ptr_Variable:=Get pointer:C304("vWeek"+String:C10($_l_WeekIndex))
				If (SD_ai_Days{$_l_DateIndex}>0)
					$_ptr_Variable->:=String:C10($_l_WeekNumber)
				Else 
					$_ptr_Variable->:=""
				End if 
			End if 
		End if 
		$_l_DateIndex:=$_l_DateIndex+1
	End while 
	If (True:C214)
		If (<>SaturdayoN=False:C215)
			$_l_Colour:=-(<>cwSelectColor+((256*Grey:K11:15)+2))
			$_l_Colour2:=-(<>cwSelectColor+(256*Grey:K11:15))
			If (Vd6#"")
				//_O_OBJECT SET COLOR(vD6;$_l_Colour)
				//OBJECT SET RGB COLORS(vd6;<>cwSelectColor;Grey)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
				OBJECT SET RGB COLORS:C628(vD6; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				// SET COLOR(vD6;$_l_Colour2)
			End if 
			If (Vd13#"")
				//_O_OBJECT SET COLOR(vD13;$_l_Colour)
				//OBJECT SET RGB COLORS(vD13;<>cwSelectColor;Grey)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
				OBJECT SET RGB COLORS:C628(vD13; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//  SET COLOR(vD13;$_l_Colour2)
			End if 
			If (Vd20#"")
				//_O_OBJECT SET COLOR(vD20;$_l_Colour)
				//OBJECT SET RGB COLORS(vD20;<>cwSelectColor;Grey)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
				OBJECT SET RGB COLORS:C628(vD20; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//  SET COLOR(vD20;$_l_Colour2)
			End if 
			If (Vd27#"")
				//_O_OBJECT SET COLOR(vD27;$_l_Colour)
				//OBJECT SET RGB COLORS(vD27;<>cwSelectColor;Grey)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
				OBJECT SET RGB COLORS:C628(vD27; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//  SET COLOR(vD27;$_l_Colour2)
			End if 
			If (Vd34#"")
				//_O_OBJECT SET COLOR(vD34;$_l_Colour)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
				OBJECT SET RGB COLORS:C628(vD34; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//    SET COLOR(vD34;$_l_Colour2)
			End if 
			
			OBJECT SET FONT STYLE:C166(vD6; 2)
			OBJECT SET FONT STYLE:C166(vD13; 2)
			OBJECT SET FONT STYLE:C166(vD20; 2)
			OBJECT SET FONT STYLE:C166(vD27; 2)
			OBJECT SET FONT STYLE:C166(vD34; 2)
		End if 
		
		If (<>SundayoN=False:C215)
			$_l_Colour:=-(<>cwSelectColor+((256*Grey:K11:15)+2))
			$_l_Colour2:=-(<>cwSelectColor+(256*Grey:K11:15))
			If (Vd7#"")
				//_O_OBJECT SET COLOR(vD7;$_l_Colour)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
				OBJECT SET RGB COLORS:C628(vD7; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//   SET COLOR(vD7;$_l_Colour2)
			End if 
			If (Vd14#"")
				//_O_OBJECT SET COLOR(vD14;$_l_Colour)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
				OBJECT SET RGB COLORS:C628(vD14; $_t_ForegroundColour; $_t_BackgroundColour)
				
				
			Else 
				//    SET COLOR(vD14;$_l_Colour2)
			End if 
			If (Vd21#"")
				//_O_OBJECT SET COLOR(vD21;$_l_Colour)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
				OBJECT SET RGB COLORS:C628(vD21; $_t_ForegroundColour; $_t_BackgroundColour)
				
				
			Else 
				//    SET COLOR(vD21;$_l_Colour2)
			End if 
			If (Vd28#"")
				//_O_OBJECT SET COLOR(vD28;$_l_Colour)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
				OBJECT SET RGB COLORS:C628(vD28; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//  SET COLOR(vD28;$_l_Colour2)
			End if 
			If (Vd35#"")
				//_O_OBJECT SET COLOR(vD35;$_l_Colour)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
				OBJECT SET RGB COLORS:C628(vD35; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//SET COLOR(vD35;$_l_Colour2)
			End if 
			
			OBJECT SET FONT STYLE:C166(vD7; 2)
			OBJECT SET FONT STYLE:C166(vD14; 2)
			OBJECT SET FONT STYLE:C166(vD21; 2)
			OBJECT SET FONT STYLE:C166(vD28; 2)
			OBJECT SET FONT STYLE:C166(vD35; 2)
		End if 
	End if 
Else 
	//passed paramters
	
	If ($2=!00-00-00!)
		$_d_InomingDate:=$1
	Else 
		$_d_InomingDate:=$2
	End if 
	vCalMth:=String:C10(Month of:C24($_d_InomingDate))
	vCalYr:=String:C10(Year of:C25($_d_InomingDate))  //Was Substring 3;2
	//vCalPeriod:=vCalYr+"/"+vCalMth
	$0:="Yes"
	$3->:=Date_FromStrs("1"; String:C10(Month of:C24($_d_InomingDate)); String:C10(Year of:C25($_d_InomingDate)))
	$_t_MonthNumberSTR:=String:C10(Month of:C24($3->+37))
	$_t_YearNumberSTR:=String:C10(Year of:C25($3->+37))
	$4->:=Date_FromStrs("1"; $_t_MonthNumberSTR; $_t_YearNumberSTR)-1
	$5->:=MonthName($_d_InomingDate)+" "+String:C10(Year of:C25($_d_InomingDate))
	If (Count parameters:C259>=7)
		$7->:=Diary_CalPic(String:C10(Month of:C24($1)); String:C10(Year of:C25($1)))
	End if 
	$_l_Day:=(Day of:C23($1))*Num:C11((Month of:C24($3->)=Month of:C24($1)) & (Year of:C25($3->)=Year of:C25(<>DB_d_CurrentDate)))
	CAL_t_CalDay:=String:C10(Day of:C23($_d_InomingDate))
	CAL_t_CalMonth:=String:C10(Month of:C24($_d_InomingDate))
	CAL_t_CalYear:=String:C10(Year of:C25($_d_InomingDate))
	$6->:=Uppercase:C13(MonthName($_d_InomingDate))+" "+String:C10(Year of:C25($_d_InomingDate))
	
	
	$_l_DateIndex:=1
	$_l_WeekIndex:=1
	$_l_WeekNumber:=0
	$_l_CalStartDay:=Day number:C114($3->)-1
	If ($_l_CalStartDay=0)
		$_l_CalStartDay:=7
	End if 
	$_l_Day:=1
	For ($_l_DateIndex; 1; 37)
		//While ($_l_DateIndex<38)
		
		If ($_l_DateIndex>=$_l_CalStartDay) & (($3->+$_l_Day-1)<=$4->)
			$_ptr_Variable:=Get pointer:C304("vD"+String:C10($_l_DateIndex))
			$_ptr_Variable->:=String:C10($_l_Day)
			$_ptr_Variable2:=Get pointer:C304("bD"+String:C10($_l_DateIndex))
			OBJECT SET ENABLED:C1123($_ptr_Variable2->; True:C214)
			
			SD_ai_Days{$_l_DateIndex}:=$_l_Day
			CAL_al_DiaryDays{$_l_DateIndex}:=0
			$_l_Day:=$_l_Day+1
			If (($_l_Day#0) & (<>SYS_bo_SDMonoCalendar=False:C215))
				If (($_l_DateIndex-$_l_CalStartDay+1)=$_l_Day)
					///$_l_Colour:=-(<>cwSelectColor+(256*Grey))
					//_O_OBJECT SET COLOR($_ptr_Variable->;$_l_Colour)
					$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
					$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15)
					OBJECT SET RGB COLORS:C628($_ptr_Variable->; $_t_ForegroundColour; $_t_BackgroundColour)
					
					OBJECT SET FONT STYLE:C166($_ptr_Variable->; <>cwSelectStyle)
				Else 
					OBJECT SET FONT STYLE:C166($_ptr_Variable->; 0)
				End if 
			Else 
				$_l_Colour:=-(15+(256*242))
				//_O_OBJECT SET COLOR($_ptr_Variable->;$_l_Colour)
				//OBJECT SET RGB COLORS($_ptr_Variable->;15;242)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(15)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(242)
				OBJECT SET RGB COLORS:C628($_ptr_Variable->; $_t_ForegroundColour; $_t_BackgroundColour)
				
				OBJECT SET FONT STYLE:C166($_ptr_Variable->; 0)
			End if 
		Else 
			$_ptr_Variable:=Get pointer:C304("vD"+String:C10($_l_DateIndex))
			$_ptr_Variable->:=""
			SD_ai_Days{$_l_DateIndex}:=0
		End if 
		If ($_l_Day-1=Num:C11(CAL_t_CalDay))
			//FONT STYLE($_ptr_Variable->;1)
		End if 
		CAL_al_DiaryDays{$_l_DateIndex}:=0
		If (($_l_DateIndex=7) | ($_l_DateIndex=8) | ($_l_DateIndex=15) | ($_l_DateIndex=22) | ($_l_DateIndex=29) | ($_l_DateIndex=36))
			If ($_l_DateIndex=7)
				$_d_Datec:=Date_FromStrs(String:C10(SD_ai_Days{$_l_DateIndex}); String:C10(Month of:C24($_d_InomingDate)); String:C10(Year of:C25($_d_InomingDate)))
				
				$_l_WeekNumber:=Abs:C99((((!1995-01-06!-$_d_Datec)/7)-1)+(((Year of:C25($_d_InomingDate))-1995)*52))
				
				
				vWeek1:=String:C10($_l_WeekNumber)
			Else 
				$_l_WeekIndex:=$_l_WeekIndex+1
				$_l_WeekNumber:=$_l_WeekNumber+1
				If ($_l_WeekNumber=53)
					$_l_WeekNumber:=1
				End if 
				$_ptr_Variable:=Get pointer:C304("vWeek"+String:C10($_l_WeekIndex))
				If (SD_ai_Days{$_l_DateIndex}>0)
					$_ptr_Variable->:=String:C10($_l_WeekNumber)
				Else 
					$_ptr_Variable->:=""
				End if 
			End if 
		End if 
		
	End for 
	If (True:C214)
		If (<>SaturdayoN=False:C215)
			$_l_Colour:=-(<>cwSelectColor+(256*(Grey:K11:15+2)))
			$_l_Colour2:=-(<>cwSelectColor+(256*Grey:K11:15))
			If (Vd6#"")
				//_O_OBJECT SET COLOR(vD6;$_l_Colour)
				//OBJECT SET RGB COLORS(Vd6;<>cwSelectColor;Grey+2)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15+2)
				OBJECT SET RGB COLORS:C628(Vd6; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				// SET COLOR(vD6;$_l_Colour2)
			End if 
			If (Vd13#"")
				//_O_OBJECT SET COLOR(vD13;$_l_Colour)
				//OBJECT SET RGB COLORS(vD13;<>cwSelectColor;Grey+2)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15+2)
				OBJECT SET RGB COLORS:C628(Vd13; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//  SET COLOR(vD13;$_l_Colour2)
			End if 
			If (Vd20#"")
				//_O_OBJECT SET COLOR(vD20;$_l_Colour)
				//OBJECT SET RGB COLORS(vD20;<>cwSelectColor;Grey+2)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15+2)
				OBJECT SET RGB COLORS:C628(Vd29; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//  SET COLOR(vD20;$_l_Colour2)
			End if 
			If (Vd27#"")
				//_O_OBJECT SET COLOR(vD27;$_l_Colour)
				//OBJECT SET RGB COLORS(vD27;<>cwSelectColor;Grey+2)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15+2)
				OBJECT SET RGB COLORS:C628(Vd27; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//  SET COLOR(vD27;$_l_Colour2)
			End if 
			If (Vd34#"")
				//_O_OBJECT SET COLOR(vD34;$_l_Colour)
				//OBJECT SET RGB COLORS(vD34;<>cwSelectColor;Grey+2)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15+2)
				OBJECT SET RGB COLORS:C628(Vd35; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//    SET COLOR(vD34;$_l_Colour2)
			End if 
			
			OBJECT SET FONT STYLE:C166(vD6; 2)
			OBJECT SET FONT STYLE:C166(vD13; 2)
			OBJECT SET FONT STYLE:C166(vD20; 2)
			OBJECT SET FONT STYLE:C166(vD27; 2)
			OBJECT SET FONT STYLE:C166(vD34; 2)
		End if 
		
		If (<>SundayoN=False:C215)
			$_l_Colour:=-(<>cwSelectColor+(256*(Grey:K11:15+2)))
			$_l_Colour2:=-(<>cwSelectColor+(256*Grey:K11:15))
			If (Vd7#"")
				//_O_OBJECT SET COLOR(vD7;$_l_Colour)
				//OBJECT SET RGB COLORS(vD7;<>cwSelectColor;Grey+2)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15+2)
				OBJECT SET RGB COLORS:C628(Vd7; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//   SET COLOR(vD7;$_l_Colour2)
			End if 
			If (Vd14#"")
				//_O_OBJECT SET COLOR(vD14;$_l_Colour)
				//OBJECT SET RGB COLORS(vD14;<>cwSelectColor;Grey+2)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15+2)
				OBJECT SET RGB COLORS:C628(Vd14; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//    SET COLOR(vD14;$_l_Colour2)
			End if 
			If (Vd21#"")
				//_O_OBJECT SET COLOR(vD21;$_l_Colour)
				//OBJECT SET RGB COLORS(vD21;<>cwSelectColor;Grey+2)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15+2)
				OBJECT SET RGB COLORS:C628(Vd21; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//    SET COLOR(vD21;$_l_Colour2)
			End if 
			If (Vd28#"")
				//_O_OBJECT SET COLOR(vD28;$_l_Colour)
				//OBJECT SET RGB COLORS(vD28;<>cwSelectColor;Grey+2)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15+2)
				OBJECT SET RGB COLORS:C628(Vd28; $_t_ForegroundColour; $_t_BackgroundColour)
				
			Else 
				//  SET COLOR(vD28;$_l_Colour2)
			End if 
			If (Vd35#"")
				//OBJECT SET RGB COLORS(vD35;<>cwSelectColor;Grey+2)
				$_t_ForeGroundColour:=UTIL_4DColorToRGB(<>cwSelectColor)
				$_t_BackGroundColour:=UTIL_4DColorToRGB(Grey:K11:15+2)
				OBJECT SET RGB COLORS:C628(Vd35; $_t_ForegroundColour; $_t_BackgroundColour)
				
				//_O_OBJECT SET COLOR(vD35;$_l_Colour)
			Else 
				//SET COLOR(vD35;$_l_Colour2)
			End if 
			
			OBJECT SET FONT STYLE:C166(vD7; 2)
			OBJECT SET FONT STYLE:C166(vD14; 2)
			OBJECT SET FONT STYLE:C166(vD21; 2)
			OBJECT SET FONT STYLE:C166(vD28; 2)
			OBJECT SET FONT STYLE:C166(vD35; 2)
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("Diary_CalPer"; $_t_oldMethodName)
