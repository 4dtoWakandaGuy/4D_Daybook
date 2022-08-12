//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_IsDaylightTime_Rule_1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 12:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_DST; $0)
	C_DATE:C307($_d_Date; $1)
	C_LONGINT:C283($_l_Day; $_l_DayNo; $_l_LastDayNo; $_l_Month)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_IsDaylightTime_Rule_1")

If (Count parameters:C259>0)
	$_d_Date:=$1
Else 
	$_d_Date:=Current date:C33(*)
End if 

$_l_Month:=Month of:C24($_d_Date)
$_l_Day:=Day of:C23($_d_Date)
$_l_DayNo:=Day number:C114($_d_Date)

$_bo_DST:=True:C214

//========================    Method Actions    ==================================

Case of 
	: (($_l_Month>March:K10:3) & ($_l_Month<October:K10:10))
		
	: ($_l_Month=March:K10:3)
		////  begins on the last Sunday in March
		$_l_LastDayNo:=Day number:C114(Date:C102(String:C10(March:K10:3; "00")+"/31/"+String:C10(Year of:C25($_d_Date))))
		Case of 
			: (($_l_LastDayNo=Sunday:K10:19) & ($_l_Day>30))
			: (($_l_LastDayNo=Monday:K10:13) & ($_l_Day>29))
			: (($_l_LastDayNo=Tuesday:K10:14) & ($_l_Day>28))
			: (($_l_LastDayNo=Wednesday:K10:15) & ($_l_Day>27))
			: (($_l_LastDayNo=Thursday:K10:16) & ($_l_Day>26))
			: (($_l_LastDayNo=Friday:K10:17) & ($_l_Day>25))
			: (($_l_LastDayNo=Saturday:K10:18) & ($_l_Day>24))
			Else 
				$_bo_DST:=False:C215
		End case 
		
	: ($_l_Month=October:K10:10)
		////  ends on  the last Sunday in October
		$_l_LastDayNo:=Day number:C114(Date:C102(String:C10(October:K10:10; "00")+"/31/"+String:C10(Year of:C25($_d_Date))))
		Case of 
			: (($_l_LastDayNo=Sunday:K10:19) & ($_l_Day<31))
			: (($_l_LastDayNo=Monday:K10:13) & ($_l_Day<30))
			: (($_l_LastDayNo=Tuesday:K10:14) & ($_l_Day<29))
			: (($_l_LastDayNo=Wednesday:K10:15) & ($_l_Day<28))
			: (($_l_LastDayNo=Thursday:K10:16) & ($_l_Day<27))
			: (($_l_LastDayNo=Friday:K10:17) & ($_l_Day<26))
			: (($_l_LastDayNo=Saturday:K10:18) & ($_l_Day<25))
			Else 
				$_bo_DST:=False:C215
		End case 
		
	Else 
		$_bo_DST:=False:C215
		
End case 

//========================    Clean up and Exit    =================================

$0:=$_bo_DST
ERR_MethodTrackerReturn("Cal4D_IsDaylightTime_Rule_1"; $_t_oldMethodName)