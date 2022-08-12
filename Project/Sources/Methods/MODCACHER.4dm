//%attributes = {}
If (False:C215)
	//Project Method Name:      MODCACHER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 09:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldIndex; $_l_TableIndex)
	C_POINTER:C301($_ptr_Field; $_ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MODCACHER")
//this method will execute loads of queries-to fill the cache and boost performanc

MESSAGES ON:C181
Open window:C153(20; 60; 300; 200; -1984)

For ($_l_TableIndex; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_TableIndex))
		DelayTicks(20*60)
		For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableIndex))
			If (Is field number valid:C1000($_l_TableIndex; $_l_FieldIndex))
				ERASE WINDOW:C160
				
				MESSAGE:C88("Checking Table: "+Table name:C256($_l_TableIndex)+Char:C90(13)+"Checking field: "+Field name:C257($_l_TableIndex; $_l_FieldIndex))
				
				$_ptr_Table:=Table:C252($_l_TableIndex)
				$_ptr_Field:=Field:C253($_l_TableIndex; $_l_FieldIndex)
				If ($_l_FieldIndex=1) | ($_l_FieldIndex=10) | ($_l_FieldIndex=20)
					Case of 
						: (Type:C295($_ptr_Field->)=0)
							QUERY:C277($_ptr_Table->; $_ptr_Field->#"")
						: (Type:C295($_ptr_Field->)=2)
							QUERY:C277($_ptr_Table->; $_ptr_Field->#"")
						: (Type:C295($_ptr_Field->)=1)
							QUERY:C277($_ptr_Table->; $_ptr_Field->#-1121111)
						: (Type:C295($_ptr_Field->)=8)
							QUERY:C277($_ptr_Table->; $_ptr_Field->#-1121111)
						: (Type:C295($_ptr_Field->)=9)
							QUERY:C277($_ptr_Table->; $_ptr_Field->#-1121111)
						: (Type:C295($_ptr_Field->)=4)
							QUERY:C277($_ptr_Table->; $_ptr_Field->#!1875-01-01!)
						: (Type:C295($_ptr_Field->)=11)
							QUERY:C277($_ptr_Table->; $_ptr_Field->#?01:01:01?)
						: (Type:C295($_ptr_Field->)=6)
							QUERY:C277($_ptr_Table->; $_ptr_Field->#True:C214)
							QUERY:C277($_ptr_Table->; $_ptr_Field->#False:C215)
					End case 
				End if 
				UNLOAD RECORD:C212($_ptr_Table->)
				DelayTicks(2*60)
			End if 
		End for 
	End if 
End for 
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("MODCACHER"; $_t_oldMethodName)
