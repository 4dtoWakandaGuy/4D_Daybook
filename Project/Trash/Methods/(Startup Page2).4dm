//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Startup Page2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>VATCash; $_bo_Continue; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>BUTTPROC; <>PER_l_CurrentPersFunctions; <>SYS_l_DateFormatPreference; $_l_Functionality; $_l_Index; $_l_PeriodID; $_l_WindowReferenceRow; ch1; ch2; ch3; r1)
	C_LONGINT:C283(vAdd; WIN_l_CurrentWinRef)
	C_REAL:C285(vTot; vTot2)
	C_TEXT:C284(<>YrPerF; <>YrPerT; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vPeriod)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup Page2")
//Startup Page2
If (<>DB_d_CurrentDate=!00-00-00!)
	
	<>DB_d_CurrentDate:=Current date:C33
	<>CTime:=Current time:C178
	<>SYS_l_DateFormatPreference:=Date_Format(<>DB_d_CurrentDate)
End if 
Open_Any_Window(322; 450)
DIALOG:C40([COMPANIES:2]; "dAsk Startup2")
CLOSE WINDOW:C154

If (OK=1)
	DB_SaveRecord(->[USER:15])
	//reload the prefs that may have changed
	<>YrPerF:=[USER:15]Year PeriodF:22
	<>YrPerT:=[USER:15]Year PeriodT:23
	<>VATCash:=[USER:15]VAT Cash:212
	
	//do the Opening Balances
	$_l_Functionality:=0
	$_l_Functionality:=$_l_Functionality ?+ 3
	
	If ((<>ButtProc=0) & (<>PER_l_CurrentPersFunctions ?? 3))
		In_ButtProc
		$_l_Index:=0
		While (($_l_Index<10000) & (Process state:C330(<>ButtProc)#2))
			IDLE:C311
			$_l_Index:=$_l_Index+1
		End while 
	End if 
	Start_Process
	vPeriod:=[USER:15]Year PeriodF:22
	
	If (DB_t_CurrentFormUsage#"Again")  //if really starting, Open the OB & current Periods
		READ WRITE:C146([PERIODS:33])
		QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=vPeriod)
		[PERIODS:33]NL_Closed:5:=False:C215
		[PERIODS:33]PL_Closed:8:=False:C215
		[PERIODS:33]SL_Closed:7:=False:C215
		DB_SaveRecord(->[PERIODS:33])
		AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
		vDate:=<>DB_d_CurrentDate
		$_l_PeriodID:=Check_Period
		[PERIODS:33]NL_Closed:5:=False:C215
		[PERIODS:33]PL_Closed:8:=False:C215
		[PERIODS:33]SL_Closed:7:=False:C215
		DB_SaveRecord(->[PERIODS:33])
		AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
		UNLOAD RECORD:C212([PERIODS:33])
		READ ONLY:C145([PERIODS:33])
	End if 
	
	vTot:=0
	vTot2:=0
	r1:=0
	vAdd:=1
	$_bo_Continue:=True:C214
	If (ch1=1)
		$_bo_Continue:=Startup_SLOB
	End if 
	If (ch2=1) & ($_bo_Continue)
		$_bo_Continue:=Startup_PLOB
	End if 
	If (ch3=1) & ($_bo_Continue)
		$_bo_Continue:=Startup_GLOB
	End if 
	If ((ch1=0) & (ch2=0) & (ch3=0))
		[USER:15]Opening Balance:49:=""
		DB_SaveRecord(->[USER:15])
	End if 
	
End if 
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
ERR_MethodTrackerReturn("Startup Page2"; $_t_oldMethodName)
