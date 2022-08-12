//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SetFooters
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
	C_LONGINT:C283($_l_FieldNumber; $_l_FootersSetOffset; $_l_Index; $_l_offset; $_l_Parameter1; $_l_Parameter2; $_l_TableNumber; $0; $2; $3; $4)
	C_LONGINT:C283(LBI_l_FooterSet)
	C_POINTER:C301($_ptr_Variable; $_ptr_Variable2; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; $5; $6; LBi_t_labe30; LBi_t_labe34; LBi_t_labe40; LBi_t_labe41; LBi_t_label1; LBi_t_label10; LBi_t_label11)
	C_TEXT:C284(LBi_t_label12; LBi_t_label13; LBi_t_label14; LBi_t_label15; LBi_t_label16; LBi_t_label17; LBi_t_label18; LBi_t_label19; LBi_t_label2; LBi_t_label20; LBi_t_label21)
	C_TEXT:C284(LBi_t_label22; LBi_t_label23; LBi_t_label24; LBi_t_label25; LBi_t_label26; LBi_t_label27; LBi_t_label28; LBi_t_label29; LBi_t_label3; LBi_t_label31; LBi_t_label32)
	C_TEXT:C284(LBi_t_label33; LBi_t_label35; LBi_t_label36; LBi_t_label37; LBi_t_label38; LBi_t_label39; LBi_t_label4; LBi_t_label5; LBi_t_label6; LBi_t_label7; LBi_t_label8)
	C_TEXT:C284(LBi_t_label9; LBi_t_Value1; LBi_t_Value10; LBi_t_Value11; LBi_t_Value12; LBi_t_Value13; LBi_t_Value14; LBi_t_Value15; LBi_t_Value16; LBi_t_Value17; LBi_t_Value18)
	C_TEXT:C284(LBi_t_Value19; LBi_t_Value2; LBi_t_Value20; LBi_t_Value21; LBi_t_Value22; LBi_t_Value23; LBi_t_Value24; LBi_t_Value25; LBi_t_Value26; LBi_t_Value27; LBi_t_Value28)
	C_TEXT:C284(LBi_t_Value29; LBi_t_Value3; LBi_t_Value31; LBi_t_Value32; LBi_t_Value33; LBi_t_Value35; LBi_t_Value36; LBi_t_Value37; LBi_t_Value38; LBi_t_Value39; LBi_t_Value4)
	C_TEXT:C284(LBi_t_Value5; LBi_t_Value6; LBi_t_Value7; LBi_t_Value8; LBi_t_Value9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetFooters")
//This method will emulate in Daybook the the behaviour ot AL_SetFooters. This will not actually set a footer on the Listbox area instead it will position some varaibles below it

$_l_FootersSetOffset:=20*(LBI_l_FooterSet-1)  //THIS ENABLES A SECOND SET OF FOOTER VARS-STARTING AT 22
$0:=$4
//`C_POINTER($2)  `Pointer to variable containing the column to put in the footer(or an array of columns)
//C_POINTER($3)  `Pointer to varaible containing the Value(as text) to display
//C_POINTER($4)  `Pointer to `variable containing the
//$ListboxName
If ($3<=1)
	RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	If (Count parameters:C259>=6)
		OBJECT SET VISIBLE:C603(*; "oFootRct"+$_t_VariableName; True:C214)
		If ($4<=20)
			$_ptr_Variable:=Get pointer:C304("LBi_t_label"+String:C10($4+$_l_FootersSetOffset+1))
			$_ptr_Variable2:=Get pointer:C304("LBi_t_Value"+String:C10($4+$_l_FootersSetOffset+1))
			$0:=$4+1
			OBJECT SET VISIBLE:C603($_ptr_Variable->; True:C214)
			OBJECT SET VISIBLE:C603($_ptr_Variable2->; True:C214)
			$_ptr_Variable->:=$6
			$_ptr_Variable2->:=$5
		End if 
	Else 
		OBJECT SET VISIBLE:C603(*; "oFootRct"+$_t_VariableName; False:C215)
		If ($4<=20)
			$_ptr_Variable:=Get pointer:C304("LBi_t_label"+String:C10($4+$_l_FootersSetOffset+1))
			$_ptr_Variable2:=Get pointer:C304("LBi_t_Value"+String:C10($4+$_l_FootersSetOffset+1))
			$0:=$4+1
			OBJECT SET VISIBLE:C603($_ptr_Variable->; False:C215)
			OBJECT SET VISIBLE:C603($_ptr_Variable2->; False:C215)
		End if 
		
	End if 
	
	
Else 
	$_l_Parameter1:=5
	$_l_Parameter2:=6
	For ($_l_Index; 1; $3)
		$_l_offset:=$_l_Index-1
		
		RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_ptr_Variable:=Get pointer:C304("LBi_t_label"+String:C10($4+$_l_FootersSetOffset+1+($_l_offset)))
		$_ptr_Variable2:=Get pointer:C304("LBi_t_Value"+String:C10($4+$_l_FootersSetOffset+1+($_l_offset)))
		If (Count parameters:C259>=$_l_Parameter2)
			If ($_l_Index<=20)
				OBJECT SET VISIBLE:C603(*; "oFootRct"+$_t_VariableName; True:C214)
				OBJECT SET VISIBLE:C603($_ptr_Variable->; True:C214)
				OBJECT SET VISIBLE:C603($_ptr_Variable2->; True:C214)
				$_ptr_Variable->:=${$_l_Parameter2}
				$_ptr_Variable2->:=${$_l_Parameter1}
			End if 
			$_l_Parameter2:=$_l_Parameter2+2
			$_l_Parameter1:=$_l_Parameter1+1
			
		Else 
			If ($_l_Index=1)
				OBJECT SET VISIBLE:C603(*; "oFootRct"+$_t_VariableName; False:C215)
			End if 
			If ($_l_Index<=20)
				OBJECT SET VISIBLE:C603($_ptr_Variable->; False:C215)
				OBJECT SET VISIBLE:C603($_ptr_Variable2->; False:C215)
			End if 
		End if 
		
	End for 
	$0:=$4+1+$3
	
End if 

//set the colour of the rectangle
//Get the coloumn name
ERR_MethodTrackerReturn("LB_SetFooters"; $_t_oldMethodName)