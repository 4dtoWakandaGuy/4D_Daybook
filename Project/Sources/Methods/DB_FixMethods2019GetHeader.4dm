//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_FixMethods2019GetHeader
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/12/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AmendmentsFound; $_bo_CreatedDateFound; $_bo_CreatorFound; $_bo_DeclarationsFound; $_bo_DescriptionFound; $_bo_ModifiedDateFound; $_bo_ModifierFound; $_bo_NameFound; $_bo_ParametersFound; $_bo_RevisionsFound)
	C_LONGINT:C283($_l_GetItems; $_l_Headers; $_l_Next; $_l_Position)
	C_POINTER:C301($_Ptr_HeaderLinesArray; $_Ptr_ItemsArray; $_ptr_ValuesArray; $2; $3; $4)
	C_TEXT:C284($_t_Amendments; $_t_Creator; $_t_DateTime; $_t_Delcarations; $_t_Description; $_t_Headertype; $_t_HeeaderType; $_t_ModificationNotes; $_t_Name; $_t_Parameters; $_t_Revisions)
	C_TEXT:C284($1)
End if 
//Code Starts Here
$_t_Headertype:=$1
$_Ptr_HeaderLinesArray:=$2
$_Ptr_ItemsArray:=$3
$_ptr_ValuesArray:=$4
Case of 
	: ($_t_HeaderType="OLD")
		$_bo_CreatorFound:=False:C215
		$_bo_CreatedDateFound:=False:C215
		$_bo_NameFound:=False:C215
		$_bo_DescriptionFound:=False:C215
		$_bo_ParametersFound:=False:C215
		$_bo_DeclarationsFound:=False:C215
		$_bo_AmendmentsFound:=False:C215
		For ($_l_Headers; 1; Size of array:C274($_Ptr_HeaderLinesArray->))
			Case of 
				: (Position:C15("Creator: "; $_Ptr_HeaderLinesArray->{$_l_Headers})>0) & ($_bo_CreatorFound=False:C215)
					
					$_l_Position:=Position:C15("Creator: "; $_Ptr_HeaderLinesArray->{$_l_Headers})
					$_Ptr_HeaderLinesArray->{$_l_Headers}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_Headers}; $_l_Position)
					$_t_Creator:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_Headers}; "Creator: "; "")
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Creator")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Creator)
					$_bo_CreatorFound:=True:C214
				: (Position:C15("Date & time: "; $_Ptr_HeaderLinesArray->{$_l_Headers})>0) & ($_bo_CreatedDateFound=False:C215)
					$_l_Position:=Position:C15("Date & time: "; $_Ptr_HeaderLinesArray->{$_l_Headers})
					$_Ptr_HeaderLinesArray->{$_l_Headers}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_Headers}; $_l_Position)
					$_t_DateTime:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_Headers}; "Date & time: "; "")
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Created Date")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_DateTime)
					$_bo_CreatedDateFound:=True:C214
				: (Position:C15("Method Name: "; $_Ptr_HeaderLinesArray->{$_l_Headers})>0) & ($_bo_NameFound=False:C215)
					$_l_Position:=Position:C15("Method Name: "; $_Ptr_HeaderLinesArray->{$_l_Headers})
					$_Ptr_HeaderLinesArray->{$_l_Headers}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_Headers}; $_l_Position)
					$_t_Name:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_Headers}; "Method Name: "; "")
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Name")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Name)
					$_bo_NameFound:=True:C214
				: (Position:C15("Description"; $_Ptr_HeaderLinesArray->{$_l_Headers})>0) & ($_bo_DescriptionFound=False:C215)
					$_l_Position:=Position:C15("Description"; $_Ptr_HeaderLinesArray->{$_l_Headers})
					$_Ptr_HeaderLinesArray->{$_l_Headers}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_Headers}; $_l_Position)
					$_t_Description:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_Headers}; "Description"; "")
					//The description may go on for multiple lines.
					For ($_l_Next; $_l_Headers+1; Size of array:C274($_Ptr_HeaderLinesArray->))
						If (Position:C15("//Parameters"; $_Ptr_HeaderLinesArray->{$_l_Next})=0)
							//this is still part of the description
							$_t_Description:=$_t_Description+Char:C90(13)+$_Ptr_HeaderLinesArray->{$_l_Next}
						Else 
							$_l_Headers:=$_l_Next-1
							$_l_Next:=Size of array:C274($_Ptr_HeaderLinesArray->)
							
						End if 
					End for 
					
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Description")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Description)
					$_bo_DescriptionFound:=True:C214
				: (Position:C15("//Parameters"; $_Ptr_HeaderLinesArray->{$_l_Headers})>0) & ($_bo_ParametersFound=False:C215)
					$_l_Position:=Position:C15("Parameters"; $_Ptr_HeaderLinesArray->{$_l_Headers})
					$_Ptr_HeaderLinesArray->{$_l_Headers}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_Headers}; $_l_Position)
					$_t_Parameters:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_Headers}; "Parameters"; "")
					//The parameters may go on for multiple lines.
					For ($_l_Next; $_l_Headers+1; Size of array:C274($_Ptr_HeaderLinesArray->))
						If (Position:C15("//Declarations"; $_Ptr_HeaderLinesArray->{$_l_Next})=0)
							//this is still part of the Parameters
							$_t_Parameters:=$_t_Parameters+Char:C90(13)+$_Ptr_HeaderLinesArray->{$_l_Next}
						Else 
							$_l_Headers:=$_l_Next-1
							$_l_Next:=Size of array:C274($_Ptr_HeaderLinesArray->)
							
						End if 
					End for 
					
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Parameters")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Parameters)
					$_bo_ParametersFound:=True:C214
				: (Position:C15("//Declarations"; $_Ptr_HeaderLinesArray->{$_l_Headers})>0) & ($_bo_DeclarationsFound=False:C215)
					$_l_Position:=Position:C15("Declarations"; $_Ptr_HeaderLinesArray->{$_l_Headers})
					$_Ptr_HeaderLinesArray->{$_l_Headers}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_Headers}; $_l_Position)
					$_t_Delcarations:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_Headers}; "Declarations"; "")
					//The Declarations may go on for multiple lines.
					For ($_l_Next; $_l_Headers+1; Size of array:C274($_Ptr_HeaderLinesArray->))
						If (Position:C15("//Project method Amendments"; $_Ptr_HeaderLinesArray->{$_l_Next})=0)
							//this is still part of the Declarations
							$_t_Delcarations:=$_t_Delcarations+Char:C90(13)+$_Ptr_HeaderLinesArray->{$_l_Next}
						Else 
							$_l_Headers:=$_l_Next-1
							$_l_Next:=Size of array:C274($_Ptr_HeaderLinesArray->)
							
						End if 
					End for 
					
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Declarations")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Delcarations)
					$_bo_DeclarationsFound:=True:C214
					
				: (Position:C15("//Project method Amendments"; $_Ptr_HeaderLinesArray->{$_l_Headers})>0) & ($_bo_AmendmentsFound=False:C215)
					$_l_Position:=Position:C15("Project method Amendments"; $_Ptr_HeaderLinesArray->{$_l_Headers})
					$_Ptr_HeaderLinesArray->{$_l_Headers}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_Headers}; $_l_Position)
					$_t_Amendments:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_Headers}; "Project method Amendments"; "")
					//The amendments may go on for multiple lines.
					For ($_l_Next; $_l_Headers+1; Size of array:C274($_Ptr_HeaderLinesArray->))
						If (Position:C15("//End Project method Amendments"; $_Ptr_HeaderLinesArray->{$_l_Next})=0)
							//this is still part of the amendments
							$_t_Amendments:=$_t_Amendments+Char:C90(13)+$_Ptr_HeaderLinesArray->{$_l_Next}
						Else 
							$_l_Headers:=$_l_Next-1
							$_l_Next:=Size of array:C274($_Ptr_HeaderLinesArray->)
							
						End if 
					End for 
					
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Amendments")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Amendments)
					$_bo_DeclarationsFound:=True:C214
					
			End case 
		End for 
		
		
	Else 
		ARRAY TEXT:C222($_Ptr_ItemsArray->; 0)
		ARRAY TEXT:C222($_ptr_ValuesArray->; 0)
		$_bo_CreatorFound:=False:C215
		$_bo_CreatedDateFound:=False:C215
		$_bo_NameFound:=False:C215
		$_bo_DescriptionFound:=False:C215
		$_bo_RevisionsFound:=False:C215
		$_bo_ModifierFound:=False:C215
		$_bo_ModifiedDateFound:=False:C215
		
		For ($_l_GetItems; 1; Size of array:C274($_Ptr_HeaderLinesArray->))
			Case of 
				: (Position:C15("Created BY: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_CreatorFound=False:C215)
					
					$_l_Position:=Position:C15("Created BY: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_Creator:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "Created BY: "; "")
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Creator")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Creator)
					$_bo_CreatorFound:=True:C214
				: (Position:C15("Date Created:"; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_CreatedDateFound=False:C215)
					$_l_Position:=Position:C15("Date Created: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_DateTime:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "Date Created: "; "")
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Created Date")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_DateTime)
					$_bo_CreatedDateFound:=True:C214
				: (Position:C15("Object Name: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_NameFound=False:C215)
					$_l_Position:=Position:C15("Object Name: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_Name:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "Object Name:: "; "")
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Name")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Name)
					$_bo_NameFound:=True:C214
				: (Position:C15("Database method Name: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_NameFound=False:C215)
					$_l_Position:=Position:C15("Database method Name: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_Name:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "Database method Name: "; "")
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Name")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Name)
					$_bo_NameFound:=True:C214
				: (Position:C15("Project method Name: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_NameFound=False:C215)
					$_l_Position:=Position:C15("Project method Name: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_Name:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "Project method Name: "; "")
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Name")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Name)
					$_bo_NameFound:=True:C214
					
				: (Position:C15("----------------- Script Notes ------------------"; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_DescriptionFound=False:C215)
					$_l_Position:=Position:C15("----------------- Script Notes ------------------"; $_Ptr_HeaderLinesArray->{$_l_GetItems})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_Description:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "----------------- Script Notes ------------------"; "")
					//The description may go on for multiple lines.
					For ($_l_Next; $_l_GetItems+1; Size of array:C274($_Ptr_HeaderLinesArray->))
						If (Position:C15("Revision Control"; $_Ptr_HeaderLinesArray->{$_l_Next})=0)
							//this is still part of the description
							$_t_Description:=$_t_Description+Char:C90(13)+$_Ptr_HeaderLinesArray->{$_l_Next}
						Else 
							$_l_GetItems:=$_l_Next-1
							$_l_Next:=Size of array:C274($_Ptr_HeaderLinesArray->)
							
						End if 
					End for 
					
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Description")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Description)
					$_bo_DescriptionFound:=True:C214
				: (Position:C15("----------------- Method Notes ------------------"; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_DescriptionFound=False:C215)
					$_l_Position:=Position:C15("----------------- Method Notes ------------------"; $_Ptr_HeaderLinesArray->{$_l_GetItems})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_Description:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "----------------- Method Notes ------------------"; "")
					//The description may go on for multiple lines.
					For ($_l_Next; $_l_GetItems+1; Size of array:C274($_Ptr_HeaderLinesArray->))
						If (Position:C15("Revision Control"; $_Ptr_HeaderLinesArray->{$_l_Next})=0)
							//this is still part of the description
							$_t_Description:=$_t_Description+Char:C90(13)+$_Ptr_HeaderLinesArray->{$_l_Next}
						Else 
							$_l_GetItems:=$_l_Next-1
							$_l_Next:=Size of array:C274($_Ptr_HeaderLinesArray->)
							
						End if 
					End for 
					
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Description")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Description)
					$_bo_DescriptionFound:=True:C214
					
					
				: (Position:C15("----------------- Revision Control ----------------l"; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_RevisionsFound=False:C215)
					$_l_Position:=Position:C15("Revision Control ----------------"; $_Ptr_HeaderLinesArray->{$_l_Headers})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_Revisions:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "Revision Control ----------------"; "")
					//The parameters may go on for multiple lines.
					For ($_l_Next; $_l_GetItems+1; Size of array:C274($_Ptr_HeaderLinesArray->))
						If (Position:C15("Date Created"; $_Ptr_HeaderLinesArray->{$_l_Next})=0)
							//this is still part of the revisions
							$_t_Revisions:=$_t_Revisions+Char:C90(13)+$_Ptr_HeaderLinesArray->{$_l_Next}
						Else 
							$_l_GetItems:=$_l_Next-1
							$_l_Next:=Size of array:C274($_Ptr_HeaderLinesArray->)
							
						End if 
					End for 
					
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Revisions")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Revisions)
					$_bo_RevisionsFound:=True:C214
					
				: (Position:C15("Modified BY: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_ModifierFound=False:C215)
					
					$_l_Position:=Position:C15("Modified BY: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_Creator:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "Modified BY: "; "")
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Modified By")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_Creator)
					$_bo_ModifierFound:=True:C214
				: (Position:C15("Date Modified:"; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_ModifiedDateFound=False:C215)
					$_l_Position:=Position:C15("Date Modified: "; $_Ptr_HeaderLinesArray->{$_l_GetItems})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_DateTime:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "Date Modified: "; "")
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Modified Date")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_DateTime)
					$_bo_ModifiedDateFound:=True:C214
					
				: (Position:C15("Modification Notes"; $_Ptr_HeaderLinesArray->{$_l_GetItems})>0) & ($_bo_RevisionsFound=False:C215)
					$_l_Position:=Position:C15("Modification Notes"; $_Ptr_HeaderLinesArray->{$_l_GetItems})
					$_Ptr_HeaderLinesArray->{$_l_GetItems}:=Substring:C12($_Ptr_HeaderLinesArray->{$_l_GetItems}; $_l_Position)
					$_t_ModificationNotes:=Replace string:C233($_Ptr_HeaderLinesArray->{$_l_GetItems}; "Modification Notes"; "")
					For ($_l_Next; $_l_GetItems+1; Size of array:C274($_Ptr_HeaderLinesArray->))
						//this is still part of the revisions
						$_t_ModificationNotes:=$_t_ModificationNotes+Char:C90(13)+$_Ptr_HeaderLinesArray->{$_l_Next}
						
						
					End for 
					
					APPEND TO ARRAY:C911($_Ptr_ItemsArray->; "Modification Notes")
					APPEND TO ARRAY:C911($_ptr_ValuesArray->; $_t_ModificationNotes)
					$_bo_RevisionsFound:=True:C214
					
					
					
			End case 
			
			
		End for 
		
		
End case 
