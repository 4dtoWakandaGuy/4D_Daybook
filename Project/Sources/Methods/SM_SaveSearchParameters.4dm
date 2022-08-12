//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_SaveSearchParameters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/04/2011 14:15
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($0; $1; $3; $4; $6; SM_l_SearchNumber)
	C_POINTER:C301($5)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_SaveSearchParameters")
If (Count parameters:C259>=5)
	READ WRITE:C146([x_QUERY_PARAMETERS:134])
	
	$_bo_Continue:=False:C215
	If ($1=0)
		If ($2#"")
			$_t_SearchName:=$2
			Repeat 
				QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]Search_Name:4=$_t_SearchName; *)
				QUERY:C277([x_QUERY_PARAMETERS:134];  | [x_QUERY_PARAMETERS:134]X_ID:1=SM_l_SearchNumber)
				If (Records in selection:C76([x_QUERY_PARAMETERS:134])>=1)
					SM_l_SearchNumber:=AA_GetNextID(->SM_l_SearchNumber)
				End if 
				If (Position:C15("SMQuery"; $2)>0)
					$_t_SearchName:="SMQuery_"+String:C10(SM_l_SearchNumber)
				End if 
			Until (Records in selection:C76([x_QUERY_PARAMETERS:134])=0)
			
			CREATE RECORD:C68([x_QUERY_PARAMETERS:134])
			[x_QUERY_PARAMETERS:134]X_ID:1:=SM_l_SearchNumber
			[x_QUERY_PARAMETERS:134]Search_Name:4:=$_t_SearchName
			If ($4#-999)
				If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
					Gen_Confirm("Make search available to all?"; "Yes"; "No")
					If (OK=1)
						[x_QUERY_PARAMETERS:134]X_OwnerID:2:=0
					Else 
						[x_QUERY_PARAMETERS:134]X_OwnerID:2:=$4
					End if 
					
				Else 
					[x_QUERY_PARAMETERS:134]X_OwnerID:2:=$4
				End if 
			Else 
				[x_QUERY_PARAMETERS:134]X_OwnerID:2:=$4
			End if 
			$_bo_Continue:=True:C214
		End if 
	Else 
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$1)
		$_bo_Continue:=True:C214
		If (Records in selection:C76([x_QUERY_PARAMETERS:134])=0)
			$_bo_Continue:=False:C215
			If ($2#"")
				CREATE RECORD:C68([x_QUERY_PARAMETERS:134])
				[x_QUERY_PARAMETERS:134]X_ID:1:=$1
				[x_QUERY_PARAMETERS:134]Search_Name:4:=$_t_SearchName
				If ($4#-999)
					If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
						Gen_Confirm("Make search available to all?"; "Yes"; "No")
						If (OK=1)
							[x_QUERY_PARAMETERS:134]X_OwnerID:2:=0
						Else 
							[x_QUERY_PARAMETERS:134]X_OwnerID:2:=$4
						End if 
						
					Else 
						[x_QUERY_PARAMETERS:134]X_OwnerID:2:=$4
					End if 
				Else 
					[x_QUERY_PARAMETERS:134]X_OwnerID:2:=$4
				End if 
				
				
				$_bo_Continue:=True:C214
			End if 
		End if 
		
	End if 
	If ($_bo_Continue)
		If (Count parameters:C259>=6)
			If ($6>0)
				[x_QUERY_PARAMETERS:134]X_ContextID:3:=($3*255)+$6  //This gives up to 255 contexts per table!
			Else 
				[x_QUERY_PARAMETERS:134]X_ContextID:3:=$3
			End if 
		Else 
			[x_QUERY_PARAMETERS:134]X_ContextID:3:=$3
		End if 
		
		COPY BLOB:C558($5->; [x_QUERY_PARAMETERS:134]X_SearchValues:5; 0; 0; BLOB size:C605($5->))
		
		DB_SaveRecord(->[x_QUERY_PARAMETERS:134])
		
	End if 
	If ($4=-1)
		$0:=[x_QUERY_PARAMETERS:134]X_ID:1
	End if 
	UNLOAD RECORD:C212([x_QUERY_PARAMETERS:134])
	READ ONLY:C145([x_QUERY_PARAMETERS:134])
	
End if 
ERR_MethodTrackerReturn("SM_SaveSearchParameters"; $_t_oldMethodName)
