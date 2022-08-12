//%attributes = {}
If (False:C215)
	//Project Method Name:      SaveVirtualrelations
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
	C_LONGINT:C283($_l_CurrentFIeld; $_l_CurrentTable; $_l_OtherFIeld; $_l_OtherTable; $_l_Type; $3)
	C_POINTER:C301($1; $2; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SaveVirtualrelations")

//$1=field in table to return selection
//$2=field in table to search for related
//$3=1 $1 is the one table 2 if$1 is the many
//$4=Pointer to The value to seach for
If (Count parameters:C259>=4)
	$_l_CurrentTable:=Table:C252($1)
	$_l_CurrentFIeld:=Field:C253($1)
	$_l_OtherTable:=Table:C252($2)
	$_l_OtherFIeld:=Field:C253($2)
	CREATE RECORD:C68([xOtherRelations:138])
	Case of 
		: ($3=1)
			$_l_Type:=Type:C295($2->)
			[xOtherRelations:138]xManyTableFieldNum:4:=$_l_OtherFIeld
			[xOtherRelations:138]xManyTableNum:3:=$_l_OtherTable
			
			Case of 
				: ($_l_Type=Is alpha field:K8:1) | ($_l_Type=Is text:K8:3)
					[xOtherRelations:138]xManyTableSTRRef:8:=$4->
				Else 
					[xOtherRelations:138]xManyTableLONGref:7:=$4->
			End case 
			[xOtherRelations:138]xOneTableFieldNum:2:=$_l_CurrentFIeld
			[xOtherRelations:138]xOneTableNUm:1:=$_l_CurrentTable
			$_l_Type:=Type:C295($1->)
			Case of 
				: ($_l_Type=Is alpha field:K8:1) | ($_l_Type=Is text:K8:3)
					[xOtherRelations:138]xOneTableSTRreference:6:=$1->
				Else 
					[xOtherRelations:138]xOneTableLONGref:5:=$1->
			End case 
			
			SAVE RECORD:C53([xOtherRelations:138])
			
		Else 
			$_l_Type:=Type:C295($2->)
			[xOtherRelations:138]xManyTableFieldNum:4:=$_l_CurrentFIeld
			[xOtherRelations:138]xManyTableNum:3:=$_l_CurrentTable
			Case of 
				: ($_l_Type=Is alpha field:K8:1) | ($_l_Type=Is text:K8:3)
					[xOtherRelations:138]xManyTableSTRRef:8:=$4->
				Else 
					[xOtherRelations:138]xManyTableLONGref:7:=$4->
			End case 
			[xOtherRelations:138]xOneTableFieldNum:2:=$_l_OtherFIeld
			[xOtherRelations:138]xOneTableNUm:1:=$_l_OtherTable
			
			$_l_Type:=Type:C295($1->)
			Case of 
				: ($_l_Type=Is alpha field:K8:1) | ($_l_Type=Is text:K8:3)
					[xOtherRelations:138]xOneTableSTRreference:6:=$1->
				Else 
					[xOtherRelations:138]xOneTableLONGref:5:=$1->
			End case 
			
			SAVE RECORD:C53([xOtherRelations:138])
			
	End case 
	
End if 
ERR_MethodTrackerReturn("SaveVirtualrelations"; $_t_oldMethodName)
