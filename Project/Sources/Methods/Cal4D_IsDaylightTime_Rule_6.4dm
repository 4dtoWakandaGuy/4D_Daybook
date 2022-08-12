//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_IsDaylightTime_Rule_6
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
	C_LONGINT:C283($_l_1stDayNo; $_l_Day; $_l_DayNo; $_l_Month)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_IsDaylightTime_Rule_6")

If (Count parameters:C259>0)
	$_d_Date:=$1
Else 
	$_d_Date:=Current date:C33(*)
End if 

$_l_Month:=Month of:C24($_d_Date)
$_l_Day:=Day of:C23($_d_Date)
$_l_DayNo:=Day number:C114($_d_Date)
$_l_1stDayNo:=Day number:C114(Date:C102(String:C10($_l_Month; "00")+"/01/"+String:C10(Year of:C25($_d_Date))))

Case of 
	: (($_l_Month>=March:K10:3) & ($_l_Month<=November:K10:11))
		Case of 
			: ($_l_Month=March:K10:3)
				$_bo_DST:=($_l_Day>13)
				If (Not:C34($_bo_DST))
					////  begins on the second Sunday in March
					$_bo_DST:=True:C214
					Case of 
						: (($_l_1stDayNo=Monday:K10:13) & ($_l_Day>13))
						: (($_l_1stDayNo=Tuesday:K10:14) & ($_l_Day>12))
						: (($_l_1stDayNo=Wednesday:K10:15) & ($_l_Day>11))
						: (($_l_1stDayNo=Thursday:K10:16) & ($_l_Day>10))
						: (($_l_1stDayNo=Friday:K10:17) & ($_l_Day>9))
						: (($_l_1stDayNo=Saturday:K10:18) & ($_l_Day>8))
						: (($_l_1stDayNo=Sunday:K10:19) & ($_l_Day>7))
						Else 
							$_bo_DST:=False:C215
					End case 
				End if 
				
			: ($_l_Month=November:K10:11)
				////    ends on the first first Sunday in November.
				$_bo_DST:=True:C214
				Case of 
					: (($_l_1stDayNo=Monday:K10:13) & ($_l_Day<7))
					: (($_l_1stDayNo=Tuesday:K10:14) & ($_l_Day<6))
					: (($_l_1stDayNo=Wednesday:K10:15) & ($_l_Day<5))
					: (($_l_1stDayNo=Thursday:K10:16) & ($_l_Day<4))
					: (($_l_1stDayNo=Friday:K10:17) & ($_l_Day<3))
					: (($_l_1stDayNo=Saturday:K10:18) & ($_l_Day<2))
					: ($_l_1stDayNo#Sunday:K10:19)
					Else 
						$_bo_DST:=False:C215
				End case 
				
			Else 
				$_bo_DST:=True:C214
				
		End case 
	Else 
		$_bo_DST:=False:C215
End case 


$0:=$_bo_DST
ERR_MethodTrackerReturn("Cal4D_IsDaylightTime_Rule_6"; $_t_oldMethodName)