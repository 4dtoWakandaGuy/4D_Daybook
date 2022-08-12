//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen Unique
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_Index; $_l_SectN)
	C_TEXT:C284($_t_oldMethodName; $_t_Sect; $_t_TImeString; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen Unique")
//this procedure returns a pseudo-unique 8 character alpha string
//based on the Date & Time (incl seconds) + randomness appended to the end
$_d_Date:=Current date:C33
$_t_TImeString:=String:C10(Current time:C178)
$0:=Substring:C12(String:C10(Year of:C25($_d_Date)); 3; 2)+("0"*(Num:C11(Month of:C24($_d_Date)<10)))+String:C10(Month of:C24($_d_Date))+("0"*(Num:C11(Day of:C23($_d_Date)<10)))+String:C10(Day of:C23($_d_Date))+Substring:C12($_t_TImeString; 1; 2)+Substring:C12($_t_TImeString; 4; 2)+Substring:C12($_t_TImeString; 7; 2)+String:C10(Random:C100%1000)
$_l_Index:=1
While ($_l_Index<=Length:C16($0))
	IDLE:C311  // 03/04/03 pb
	$_t_Sect:=Substring:C12($0; $_l_Index; 2)
	If ((Length:C16($_t_Sect))>1)
		$_l_SectN:=Num:C11($_t_Sect)
		Case of 
			: (($_l_SectN>31) & ($_l_SectN#64))
				$0:=Substring:C12($0; 1; $_l_Index-1)+Char:C90($_l_SectN)+Substring:C12($0; $_l_Index+2; 32000)
			: ($_l_SectN<26)
				$0:=Substring:C12($0; 1; $_l_Index-1)+Char:C90($_l_SectN+101)+Substring:C12($0; $_l_Index+2; 32000)
			: ($_l_SectN=64)
				$0:=Substring:C12($0; 1; $_l_Index-1)+"d"+Substring:C12($0; $_l_Index+2; 32000)
			: (($_l_SectN>25) & ($_l_SectN<32))
				$0:=Substring:C12($0; 1; $_l_Index-1)+Char:C90($_l_SectN+135)+Substring:C12($0; $_l_Index+2; 32000)
		End case 
	End if 
	$_l_Index:=$_l_Index+1
End while 
If (Length:C16($0)>8)
	$0:=Substring:C12($0; Abs:C99(8-Length:C16($0))+1; 15)
End if 
ERR_MethodTrackerReturn("Gen Unique"; $_t_oldMethodName)