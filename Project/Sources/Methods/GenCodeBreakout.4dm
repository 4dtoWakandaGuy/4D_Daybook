//%attributes = {}
If (False:C215)
	//Project Method Name:      GenCodeBreakout
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/10/2010 08:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_FieldIndexed)
	C_LONGINT:C283($_l_Clash; $_l_Clashes; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_Process; $_l_Span; $_l_Span1OLD; $_l_Span2OLD; $_l_TableNumber; $_l_TestClash)
	C_LONGINT:C283($1)
	C_POINTER:C301($2)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GenCodeBreakout")
//NG May 2004
//this is the get-out clause!

Case of 
	: (Count parameters:C259=1)  //cant do much with it really!!
		//not if the field this is going into has a unique property the trigger will re-in
		$0:=(Random:C100%100000)+10
	: (Count parameters:C259>=2)
		//$2 is a pointer to the field
		$_l_TableNumber:=Table:C252($2)
		$_l_FieldNumber:=Field:C253($2)
		
		$_l_FieldType:=0
		$_l_FieldLength:=0
		$_bo_FieldIndexed:=False:C215
		$_l_TestClash:=1
		$_l_Span:=1000
		$_l_Span1OLD:=1000
		Repeat 
			$_l_Clashes:=0
			Repeat 
				$_l_TestClash:=$_l_TestClash+$_l_Span
				GET FIELD PROPERTIES:C258($2; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed)
				If (Not:C34($_bo_FieldIndexed)) & ($_l_FieldType#7)
					If (Application type:C494=4D Remote mode:K5:5)
						$_l_Process:=Execute on server:C373("AA_IndexoneField"; DB_ProcessMemoryinit(1); "Set Field Index"; $_l_TableNumber; $_l_FieldNumber; *)
						
					Else 
						$_l_Process:=New process:C317("AA_IndexoneField"; DB_ProcessMemoryinit(1); "Set Field Index"; $_l_TableNumber; $_l_FieldNumber; *)
						
					End if 
				End if 
				SET QUERY DESTINATION:C396(3; $_l_Clash)
				Case of 
					: (Type:C295($2->)=Is longint:K8:6) | (Type:C295($2->)=Is real:K8:4) | (Type:C295($2->)=Is integer:K8:5)
						Case of 
							: (Count parameters:C259=2)
								QUERY:C277(Table:C252($_l_TableNumber)->; $2->=$_l_TestClash)
							: (Count parameters:C259=3)
								QUERY:C277(Table:C252($_l_TableNumber)->; $2->=Num:C11($3+String:C10($_l_TestClash)))
								
							: (Count parameters:C259=4)
								QUERY:C277(Table:C252($_l_TableNumber)->; $2->=Num:C11($3+String:C10($_l_TestClash)+$4))
						End case 
					Else 
						Case of 
							: (Count parameters:C259=2)
								
								QUERY:C277(Table:C252($_l_TableNumber)->; $2->=String:C10($_l_TestClash))
							: (Count parameters:C259=3)
								QUERY:C277(Table:C252($_l_TableNumber)->; $2->=($3+String:C10($_l_TestClash)))
							: (Count parameters:C259=4)
								QUERY:C277(Table:C252($_l_TableNumber)->; $2->=($3+String:C10($_l_TestClash)+$4))
						End case 
						
				End case 
				SET QUERY DESTINATION:C396(0)
				If ($_l_Clash>0)
					$_l_Clashes:=$_l_Clashes+1
				End if 
				
			Until ($_l_Clash=0)
			$_l_Span2OLD:=$_l_Span
			$_l_Span:=$_l_Span1OLD
			$_l_Span:=Int:C8($_l_Span/2)
			$_l_Span1OLD:=$_l_Span
			If ($_l_Span>1)
				If ($_l_Clashes>0)
					$_l_TestClash:=$_l_TestClash-$_l_Span2OLD
				End if 
				
			End if 
			
		Until ($_l_Span<=1) | (<>SYS_bo_QuitCalled)
		$0:=$_l_TestClash
		
End case 
ERR_MethodTrackerReturn("GenCodeBreakout"; $_t_oldMethodName)