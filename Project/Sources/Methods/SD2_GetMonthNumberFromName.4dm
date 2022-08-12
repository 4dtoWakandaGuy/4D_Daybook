//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetMonthNumberFromName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MonthNumber; $0)
	C_TEXT:C284($_t_MonthName; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetMonthNumberFromName")

If (Count parameters:C259>=1)
	$_t_MonthName:=Substring:C12($1; 1; 3)
	
	Case of 
		: ($_t_MonthName="Jan")
			$_l_MonthNumber:=1
		: ($_t_MonthName="Feb")
			$_l_MonthNumber:=2
		: ($_t_MonthName="Mar")
			$_l_MonthNumber:=3
		: ($_t_MonthName="Apr")
			$_l_MonthNumber:=4
		: ($_t_MonthName="May")
			$_l_MonthNumber:=5
		: ($_t_MonthName="Jun")
			$_l_MonthNumber:=6
		: ($_t_MonthName="Jul")
			$_l_MonthNumber:=7
		: ($_t_MonthName="Aug")
			$_l_MonthNumber:=8
		: ($_t_MonthName="Sep")
			$_l_MonthNumber:=9
		: ($_t_MonthName="Oct")
			$_l_MonthNumber:=10
		: ($_t_MonthName="Nov")
			$_l_MonthNumber:=11
		: ($_t_MonthName="Dec")
			$_l_MonthNumber:=12
		Else 
			$_l_MonthNumber:=0
	End case 
	
	$0:=$_l_MonthNumber
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("SD2_GetMonthNumberFromName"; $_t_oldMethodName)
