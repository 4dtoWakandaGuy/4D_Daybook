//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Minor_IL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AddMode; vAdd)
	C_POINTER:C301($_Ptr_Variable; $1; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $2; $s; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Minor_IL")
//Check_Minor_Indirect Link
// Requires [File]field;"Text/Variable";[File];[File]code;[file]name
If ($1->#"")
	$1->:=Check_QM($1->)
	If ($4->="")
		Gen_Confirm("That "+$2+" does not exist.  Create it?"; "Try Again"; "Create it")
		If (OK=0)
			$s:=Uppercase:C13($1->)
			If (Character code:C91(Substring:C12($s; Length:C16($s); 1))=64)
				$s:=""
			End if 
			READ WRITE:C146($3->)
			CREATE RECORD:C68($3->)
			$4->:=$s
			DB_SaveRecord($3)
			$_l_AddMode:=vAdd
			vAdd:=1
			Open_Pro_Window("Enter "+$2; 0; 2; $3->; WIN_t_CurrentInputForm)  //NG may 2004 added input form
			MODIFY RECORD:C57($3->; *)
			Close_ProWin(Table name:C256($3->)+"_"+WIN_t_CurrentInputForm)  //NG may 2004 added input form name
			
			Close_ProWin
			vAdd:=$_l_AddMode
			If (OK=1)
				$1->:=$4->
			Else 
				
				DB_DeletionControl($3; "Check_Minor")
				
				DELETE RECORD:C58($3->)
				$1->:=""
				GOTO OBJECT:C206($1->)
			End if 
			//    READ ONLY($3»)
		Else 
			$1->:=""
		End if 
	End if 
	$_Ptr_Variable:=Get pointer:C304("v"+$2)
	If (Type:C295($_Ptr_Variable->)=Is string var:K8:2) | (Type:C295($_Ptr_Variable->)=Is text:K8:3) | (Type:C295($_Ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
		$_Ptr_Variable->:=$5->
	End if 
	
	$1->:=Uppercase:C13($1->)
	// UNLOAD RECORD($3»)
Else 
	$_Ptr_Variable:=Get pointer:C304("v"+$2)
	If (Type:C295($_Ptr_Variable->)=Is string var:K8:2) | (Type:C295($_Ptr_Variable->)=Is text:K8:3) | (Type:C295($_Ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
		
		$_Ptr_Variable->:=""
	End if 
	
End if 
ERR_MethodTrackerReturn("Check_Minor_IL"; $_t_oldMethodName)