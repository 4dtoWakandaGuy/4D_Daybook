//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 10/12/2010 16:43
	//Method Name: ERR_GetDataChanges
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
//$_t_oldMethodName:=ERR_MethodTracker ("ERR_GetDataChanges")
C_LONGINT:C283($_l_TableNumber)
C_TEXT:C284($0; $_t_ModifiedText)
$0:="Table Unknown"
If (Not:C34(Is nil pointer:C315(Current default table:C363)))  //ng 27/6/2003
	
	
	$_ptr_Table:=Current default table:C363
	$_t_ModifiedText:=""
	$_l_TableNumber:=Table:C252($_ptr_Table)
	If (Records in selection:C76($_ptr_Table->)>0)
		For ($i; 1; Get last field number:C255($_l_TableNumber))
			If (Is field number valid:C1000($_l_TableNumber; $i))
				If ((Type:C295(Field:C253($_l_TableNumber; $i)->)#Is picture:K8:10) & (Type:C295(Field:C253($_l_TableNumber; $i)->)#Is text:K8:3) & (Type:C295(Field:C253($_l_TableNumber; $i)->)#Is subtable:K8:11) & (Type:C295(Field:C253($_l_TableNumber; $i)->)#Is BLOB:K8:12))
					If (Old:C35(Field:C253($_l_TableNumber; $i)->)#(Field:C253($_l_TableNumber; $i)->))
						//the field is modified
						If ($_t_ModifiedText="")
							$_t_ModifiedText:=Table name:C256($_l_TableNumber)+" field "+Field name:C257($_l_TableNumber; $i)
						Else 
							$_t_ModifiedText:=$_t_ModifiedText+Char:C90(9)+Table name:C256($_l_TableNumber)+" field "+Field name:C257($_l_TableNumber; $i)
						End if 
						Case of 
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is alpha field:K8:1)
								If (Old:C35(Field:C253($_l_TableNumber; $i)->)="")
									$_t_ModifiedText:=$_t_ModifiedText+"Set to "+(Field:C253($_l_TableNumber; $i)->)
								Else 
									$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Old:C35(Field:C253($_l_TableNumber; $i)->)+" to"+(Field:C253($_l_TableNumber; $i)->)
								End if 
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is text:K8:3)
								If (Old:C35(Field:C253($_l_TableNumber; $i)->)="")
									$_t_ModifiedText:=$_t_ModifiedText+" Set to "+(Field:C253($_l_TableNumber; $i)->)
								Else 
									$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Old:C35(Field:C253($_l_TableNumber; $i)->)+" to"+(Field:C253($_l_TableNumber; $i)->)
								End if 
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is real:K8:4)
								If (Old:C35(Field:C253($_l_TableNumber; $i)->)=0)
									$_t_ModifiedText:=$_t_ModifiedText+" Set to "+String:C10((Field:C253($_l_TableNumber; $i)->))
								Else 
									$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+String:C10(Old:C35(Field:C253($_l_TableNumber; $i)->))+" to"+String:C10((Field:C253($_l_TableNumber; $i)->))
								End if 
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is integer:K8:5)
								If (Old:C35(Field:C253($_l_TableNumber; $i)->)=0)
									$_t_ModifiedText:=$_t_ModifiedText+" Set to "+String:C10(Field:C253($_l_TableNumber; $i)->)
								Else 
									$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+String:C10(Old:C35(Field:C253($_l_TableNumber; $i)->))+" to"+String:C10((Field:C253($_l_TableNumber; $i)->))
								End if 
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is longint:K8:6)
								If (Old:C35(Field:C253($_l_TableNumber; $i)->)=0)
									$_t_ModifiedText:=$_t_ModifiedText+" Set to "+String:C10((Field:C253($_l_TableNumber; $i)->))
								Else 
									$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+String:C10(Old:C35(Field:C253($_l_TableNumber; $i)->))+" to"+String:C10((Field:C253($_l_TableNumber; $i)->))
								End if 
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is date:K8:7)
								If (Old:C35(Field:C253($_l_TableNumber; $i)->)=!00-00-00!)
									$_t_ModifiedText:=$_t_ModifiedText+" Set to "+String:C10((Field:C253($_l_TableNumber; $i)->))
								Else 
									$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+String:C10(Old:C35(Field:C253($_l_TableNumber; $i)->))+" to"+String:C10((Field:C253($_l_TableNumber; $i)->))
								End if 
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is time:K8:8)
								If (Old:C35(Field:C253($_l_TableNumber; $i)->)=?00:00:00?)
									$_t_ModifiedText:=$_t_ModifiedText+" Set to"+String:C10((Field:C253($_l_TableNumber; $i)->))
								Else 
									$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+String:C10(Old:C35(Field:C253($_l_TableNumber; $i)->))+" to"+String:C10((Field:C253($_l_TableNumber; $i)->))
								End if 
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is boolean:K8:9)
								If (Old:C35(Field:C253($_l_TableNumber; $i)->)=False:C215) & (Field:C253($_l_TableNumber; $i)->=True:C214)
									$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+"FALSE"+" to"+"TRUE"
								Else 
									$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+"TRUE"+" to"+"FALSE"
								End if 
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is picture:K8:10)
								$_t_ModifiedText:=$_t_ModifiedText+" Picture Changed "
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is subtable:K8:11)
							: (Type:C295(Field:C253($_l_TableNumber; $i)->)=Is BLOB:K8:12)
								$_t_ModifiedText:=$_t_ModifiedText+" Blob Changed "
								
						End case 
					End if 
				Else 
					//`
					
				End if 
			End if 
		End for 
	End if 
	If ($_t_ModifiedText#"")
		//record is modified so
		$0:=$_t_ModifiedText
	Else 
		$0:=""
	End if 
End if 

//ERR_MethodTrackerReturn ("ERR_GetDataChanges";$_t_oldMethodName)