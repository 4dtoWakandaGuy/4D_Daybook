//%attributes = {}
If (False:C215)
	//Project Method Name:      Subscript_SDate
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
	C_DATE:C307($0; $1)
	C_LONGINT:C283($_l_Month; $_l_Year)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Subscript_SDate")
If (Count parameters:C259>=1)
	$0:=$1
	Case of 
		: ([PRODUCTS:9]Unit_Number:29=1)
			$0:=$0+[PRODUCTS:9]Every_Number:28
		: ([PRODUCTS:9]Unit_Number:29=7)
			$0:=$0+([PRODUCTS:9]Every_Number:28*[PRODUCTS:9]Unit_Number:29)
		: ([PRODUCTS:9]Unit_Number:29=31)
			$_l_Month:=Month of:C24($0)+[PRODUCTS:9]Every_Number:28
			$_l_Year:=Year of:C25($0)
			If ($_l_Month>12)
				If ($_l_Month>24)
					If ($_l_Month>36)
						$_l_Month:=$_l_Month-36
						$_l_Year:=$_l_Year+3
					Else 
						$_l_Month:=$_l_Month-24
						$_l_Year:=$_l_Year+2
					End if 
				Else 
					$_l_Month:=$_l_Month-12
					$_l_Year:=$_l_Year+1
				End if 
			Else 
				If ($_l_Month<1)
					$_l_Month:=$_l_Month+12
					$_l_Year:=$_l_Year-1
				End if 
			End if 
			$0:=Date_Proper(Day of:C23([PRODUCTS:9]First_Issue_Date:32); $_l_Month; $_l_Year)
			If ([PRODUCTS:9]Start_Number:30=7)  //if week day -based, adjust the day to fit
				$0:=Date_SameDayNo($0; [PRODUCTS:9]First_Issue_Date:32)
			End if 
		: ([PRODUCTS:9]Unit_Number:29=365)
			$_l_Year:=Year of:C25($0)+[PRODUCTS:9]Every_Number:28
			$0:=Date_Proper(Day of:C23([PRODUCTS:9]First_Issue_Date:32); Month of:C24($0); $_l_Year)
			If ([PRODUCTS:9]Start_Number:30=7)  //if week day -based, adjust the day to fit
				$0:=Date_SameDayNo($0; [PRODUCTS:9]First_Issue_Date:32)
			End if 
	End case 
Else 
	$0:=!00-00-00!
End if 
ERR_MethodTrackerReturn("Subscript_SDate"; $_t_oldMethodName)
