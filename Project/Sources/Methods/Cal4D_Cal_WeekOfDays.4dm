//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_WeekOfDays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 10:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $1)
	C_LONGINT:C283($_l_DateNum; $_l_index; $_l_Month; $_l_SizeofArray; $_l_Year)
	C_POINTER:C301($_ptr_Dates; $_ptr_OrdDates; $2; $3)
	C_TEXT:C284($_t_1stDay; $_t_MethodName; $_t_oldMethodName; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_WeekOfDays")

$_d_Date:=$1
$_ptr_OrdDates:=$2
$_ptr_Dates:=$3
$_t_1stDay:=$4

//========================    Method Actions    ==================================

$_l_DateNum:=Day number:C114($_d_Date)
Case of 
	: (($_t_1stDay="Sun") | ($_t_1stDay="") | ($_t_1stDay="US"))
		$_d_Date:=$_d_Date-($_l_DateNum-1)
		
	: (($_t_1stDay="Mon") | ($_t_1stDay="ISO") | ($_t_1stDay="EUR"))
		If ($_l_DateNum=Sunday:K10:19)
			$_d_Date:=$_d_Date-6
		Else 
			$_d_Date:=$_d_Date-($_l_DateNum-2)
		End if 
		
	: ($_t_1stDay="Sat")
		If ($_l_DateNum#Saturday:K10:18)
			$_d_Date:=$_d_Date-$_l_DateNum
		End if 
		
End case 

////  Fill a calendar week with days
////
$_l_SizeofArray:=Size of array:C274($_ptr_OrdDates->)
For ($_l_index; 1; $_l_SizeofArray)
	$_ptr_OrdDates->{$_l_index}:=Cal4D_Cal_DateToOrdinal($_d_Date)
	$_ptr_Dates->{$_l_index}:=$_d_Date
	$_d_Date:=Add to date:C393($_d_Date; 0; 0; 1)
End for 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_Cal_WeekOfDays"; $_t_oldMethodName)