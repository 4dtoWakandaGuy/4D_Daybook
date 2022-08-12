//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_WeeksToDisplay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 15:54`Method: Cal4D_Cal_WeeksToDisplay
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $1)
	C_LONGINT:C283($_l_1stDay; $_l_Days; $_l_Weeks; $_l_WeekStartsOn; $0)
	C_TEXT:C284($_t_1stDay; $_t_MethodName; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_WeeksToDisplay")

$_d_Date:=$1
$_t_1stDay:=$2
Case of 
	: ($_t_1stDay="Sun")
		$_l_WeekStartsOn:=Sunday:K10:19
	: ($_t_1stDay="Mon")
		$_l_WeekStartsOn:=Monday:K10:13
	: ($_t_1stDay="Sat")
		$_l_WeekStartsOn:=Saturday:K10:18
End case 

If (Day of:C23($_d_Date)#1)
	$_d_Date:=Add to date:C393($_d_Date; 0; 0; -(Day of:C23($_d_Date)-1))
End if 

//========================    Method Actions    ==================================

$_l_Days:=Cal4D_Cal_DaysInMonth($_d_Date)

$_l_1stDay:=Day number:C114($_d_Date)

Case of 
	: ($_l_WeekStartsOn=Sunday:K10:19)
		$_l_Weeks:=($_l_Days+($_l_1stDay-1))\7
		$_l_Weeks:=$_l_Weeks+Num:C11(($_l_Weeks*7)<($_l_Days+($_l_1stDay-1)))
		
	: ($_l_WeekStartsOn=Monday:K10:13)
		Case of 
			: ($_l_Days=31)
				If (($_l_1stDay>Sunday:K10:19) & ($_l_1stDay<Saturday:K10:18))
					$_l_Weeks:=5
				Else 
					$_l_Weeks:=6
				End if 
				
			: ($_l_Days=30)
				Case of 
					: ($_l_1stDay>Sunday:K10:19)
						$_l_Weeks:=5
					Else 
						$_l_Weeks:=6
				End case 
				
			: ($_l_Days=28)
				If ($_l_1stDay=Monday:K10:13)
					$_l_Weeks:=4
				Else 
					$_l_Weeks:=5
				End if 
				
			: ($_l_Days=29)
				$_l_Weeks:=5
				
		End case 
		
	: ($_l_WeekStartsOn=Saturday:K10:18)
		Case of 
			: ($_l_Days=31)
				If (($_l_1stDay=Saturday:K10:18) | ($_l_1stDay<Thursday:K10:16))
					$_l_Weeks:=5
				Else 
					$_l_Weeks:=6
				End if 
				
			: ($_l_Days=30)
				If (($_l_1stDay=Saturday:K10:18) | ($_l_1stDay<Friday:K10:17))
					$_l_Weeks:=5
				Else 
					$_l_Weeks:=6
				End if 
				
				
			: ($_l_Days=28)
				If ($_l_1stDay=Saturday:K10:18)
					$_l_Weeks:=4
				Else 
					$_l_Weeks:=5
				End if 
				
				
			: ($_l_Days=29)
				$_l_Weeks:=5
				
		End case 
		
End case 

//========================    Clean up and Exit    =================================

$0:=$_l_Weeks
ERR_MethodTrackerReturn("Cal4D_Cal_WeeksToDisplay"; $_t_oldMethodName)