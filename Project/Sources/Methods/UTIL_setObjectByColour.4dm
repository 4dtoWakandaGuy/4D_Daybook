//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_setObjectByColour
	//------------------ Method Notes ------------------
	//if $1=-1 this takes the object named at $2 and set the colours based on $3
	//if($1=0 then $2 is a variable name(Note the NAME) and does the same
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_BackGround; $_l_BackMax; $_l_Colour; $_l_Foregro; $_l_Foreground; $_l_Index; $_l_Index1; $_l_Index2; $_l_Result; $_l_Type; $1)
	C_LONGINT:C283($3)
	C_POINTER:C301($_ptr_Var)
	C_TEXT:C284($_t_BackGround; $_t_Foreground; $_t_Name; $2)
End if 
//Code Starts Here
$_l_Type:=$1
$_t_Name:=$2
$_l_Result:=Abs:C99($3)
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
				//$2->:=$_l_Foreground
				//$3->:=$_l_BackGround
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
$_t_Foreground:=UTIL_4DColorToRGB($_l_ForeGround)
$_t_BackGround:=UTIL_4DColorToRGB($_l_BackGround)
Case of 
	: ($1<0)
		OBJECT SET RGB COLORS:C628(*; $2; $_t_Foreground; $_t_BackGround)
		
		
	Else 
		$_ptr_Var:=Get pointer:C304($2)
		OBJECT SET RGB COLORS:C628($_ptr_Var->; $_t_Foreground; $_t_BackGround)
		
		
End case 


