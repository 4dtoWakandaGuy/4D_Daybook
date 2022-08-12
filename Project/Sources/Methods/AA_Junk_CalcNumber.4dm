//%attributes = {}

If (False:C215)
	//Project Method Name:      AA_Junk_CalcNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($2)
	//C_UNKNOWN($3)
	C_LONGINT:C283($_l_BackGround; $_l_BackMax; $_l_Colour; $_l_Foreground; $_l_Index; $_l_Index1; $_l_Index2; $_l_Result; $1)
End if 
//Code Starts Here
$_l_Result:=$1
$_l_BackMax:=100000
For ($_l_Index1; 1; 100000)
	For ($_l_Index2; 1; 100000)
		If ($_l_Index2<=$_l_BackMax)
			$_l_Foreground:=$_l_Index1-1
			$_l_BackGround:=$_l_Index2-1
			$_l_Colour:=$_l_Foreground+(256*$_l_BackGround)
			If ($_l_Colour=$_l_Result)
				//ALERT("Foreground ="+String($_l_Foreground)+" Background ="+String($_l_BackGround))
				$_l_Index1:=100000
				$_l_Index2:=100000
				$2->:=$_l_Foreground
				$3->:=$_l_BackGround
			End if 
			If ($_l_Colour>$_l_Result)
				$_l_BackMax:=$_l_Index2
				
				Case of 
					: ($_l_Index2>256)
						$_l_Index:=$_l_Index+10
					: ($_l_Index2=1)
						$_l_Index:=$_l_Index-9
				End case 
				$_l_Index2:=100000
			End if 
		Else 
			$_l_Index2:=100000
		End if 
	End for 
End for 
