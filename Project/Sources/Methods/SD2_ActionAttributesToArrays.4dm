//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ActionAttributesToArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/01/2010 16:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Data; 0)
	ARRAY LONGINT:C221($_al_ObjectAttributeTypes; 0)
	//ARRAY LONGINT(SD2_al_ActionREALFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldType;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	ARRAY TEXT:C222($_at_ObjectAttributeNames; 0)
	ARRAY TEXT:C222($_at_StringData; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_BOOLEAN:C305(SD2_bo_FieldNamesLoaded)
	C_LONGINT:C283($_l_ColumnIndex; $_l_Index; $_l_offset; $_l_Ref; $_l_VirtualFieldNumber)
	C_POINTER:C301($_ptr_Attributes; $_ptr_FieldPointer; $1)
	C_TEXT:C284($_t_FieldReferenceName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ActionAttributesToArrays")
//This method will load all the fields of a SINGLE diary action  to arrays
If (Count parameters:C259>=1)
	$_ptr_Attributes:=$1
Else 
	$_ptr_Attributes:=->[ACTIONS:13]AttributesObject:42
End if 
If (False:C215)
	$_l_offset:=SD2_ActionFields
	
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataLong; $_l_offset)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; $_l_offset)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; $_l_offset)
	ARRAY REAL:C219(SD2_ar_ActionVirtFieldDataREAL; $_l_offset)
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataMANY; $_l_offset; 0)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataMA; $_l_offset; 0)
	
	$_l_offset:=0
	For ($_l_Index; 1; Size of array:C274(SD2_al_ActionVirtFieldNum))
		$_l_VirtualFieldNumber:=SD2_al_ActionVirtFieldNum{$_l_Index}
		If (BLOB size:C605([ACTIONS:13]xActionAttributes:11)>$_l_offset)
			Case of 
				: (SD2_al_ActionVirtFieldType{$_l_Index}=9)  // Longint one dimension
					BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_al_ActionVirtFieldDataLong{$_l_Index}; $_l_offset)
					If (SD2_al_ActionVirtFieldDataLong{$_l_Index}=0)
						If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
							//this is a field in the table anyway so get the data from there
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							Case of 
								: (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
									SD2_al_ActionVirtFieldDataLong{$_l_Index}:=Num:C11($_ptr_FieldPointer->)
								: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6)
									SD2_al_ActionVirtFieldDataLong{$_l_Index}:=($_ptr_FieldPointer->)
							End case 
						End if 
						
					End if 
					
				: (SD2_al_ActionVirtFieldType{$_l_Index}=21)  // String one dimension
					BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_at_ActionVirtFieldDataTXT{$_l_Index}; $_l_offset)
					If (SD2_at_ActionVirtFieldDataTXT{$_l_Index}="")
						If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
							//this is a field in the table anyway so get the data from there
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							
							SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=$_ptr_FieldPointer->
							
						End if 
						
					End if 
					
				: (SD2_al_ActionVirtFieldType{$_l_Index}=2)  // TEXT one dimension
					BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_at_ActionVirtFieldDataTXT{$_l_Index}; $_l_offset)
					If (SD2_at_ActionVirtFieldDataTXT{$_l_Index}="")
						If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
							//this is a field in the table anyway so get the data from there
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							
							SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=$_ptr_FieldPointer->
							
						End if 
						
					End if 
					
				: (SD2_al_ActionVirtFieldType{$_l_Index}=1)  // Real one dimension
					BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFieldNumber}; $_l_offset)
					If (SD2_ar_ActionVirtFieldDataREAL{$_l_Index}=0)
						If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
							//this is a field in the table anyway so get the data from there
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							
							SD2_ar_ActionVirtFieldDataREAL{$_l_Index}:=$_ptr_FieldPointer->
							
						End if 
						
					End if 
					
					
				: (SD2_al_ActionVirtFieldType{$_l_Index}=116)  // Longint TWO dimension
					//These are all virtual
					ARRAY LONGINT:C221($_al_Data; 0)
					BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; $_al_Data; $_l_offset)
					INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_Index}; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_Index})+1; Size of array:C274($_al_Data))
					
					For ($_l_ColumnIndex; 1; Size of array:C274($_al_Data))
						SD2_al_ActionVirtFieldDataMANY{$_l_Index}{$_l_ColumnIndex}:=$_al_Data{$_l_ColumnIndex}
					End for 
					
				: (SD2_al_ActionVirtFieldType{$_l_Index}=121)  // String TWO dimension
					//These are all virtual
					ARRAY TEXT:C222($_at_StringData; 0)
					BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; $_at_StringData; $_l_offset)
					INSERT IN ARRAY:C227(SD2_at_ActionVirtFieldDataMA{$_l_Index}; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_Index})+1; Size of array:C274($_at_StringData))
					
					For ($_l_ColumnIndex; 1; Size of array:C274($_al_Data))
						SD2_at_ActionVirtFieldDataMA{$_l_Index}{$_l_ColumnIndex}:=$_at_StringData{$_l_ColumnIndex}
					End for 
					
					
			End case 
		Else 
			If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
				$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
				Case of 
					: (SD2_al_ActionVirtFieldType{$_l_Index}=9)
						$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
						Case of 
							: (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
								SD2_al_ActionVirtFieldDataLong{$_l_Index}:=Num:C11($_ptr_FieldPointer->)
							: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6)
								SD2_al_ActionVirtFieldDataLong{$_l_Index}:=($_ptr_FieldPointer->)
						End case 
						
					: (SD2_al_ActionVirtFieldType{$_l_Index}=21)
						$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
						SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=$_ptr_FieldPointer->
					: (SD2_al_ActionVirtFieldType{$_l_Index}=2)
						$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
						SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=$_ptr_FieldPointer->
					: (SD2_al_ActionVirtFieldType{$_l_Index}=1)
						$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
						SD2_ar_ActionVirtFieldDataREAL{$_l_Index}:=$_ptr_FieldPointer->
						
				End case 
				
				
			End if 
			
		End if 
		
		
	End for 
Else   //TRACE
	//TRACE
	
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataLong; 0)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; 0)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; 0)
	ARRAY REAL:C219(SD2_ar_ActionVirtFieldDataREAL; 0)
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataMANY; 0; 0)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataMA; 0; 0)
	
	//The following record of fields is only held for convenience for programming
	//$_l_offset:=SD_ActionVirtualFIelds
	
	$_l_offset:=SD2_ActionFields
	
	
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataLong; $_l_offset)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; $_l_offset)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; $_l_offset)
	ARRAY REAL:C219(SD2_ar_ActionVirtFieldDataREAL; $_l_offset)
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataMANY; $_l_offset; 0)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataMA; $_l_offset; 0)
	$_l_offset:=0
	
	OB GET PROPERTY NAMES:C1232($_ptr_Attributes->; $_at_ObjectAttributeNames; $_al_ObjectAttributeTypes)
	If (Size of array:C274($_at_ObjectAttributeNames)=0)  //the attributes are in the blob-this was the planned mechanism which is not being replaced with an object as its easier to be more flexible
		
		
		For ($_l_Index; 1; Size of array:C274(SD2_al_ActionVirtFieldNum))
			$_l_VirtualFieldNumber:=SD2_al_ActionVirtFieldNum{$_l_Index}
			If (BLOB size:C605([ACTIONS:13]xActionAttributes:11)>$_l_offset)
				Case of 
					: (SD2_al_ActionVirtFieldType{$_l_Index}=9)  // Longint one dimension
						BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_al_ActionVirtFieldDataLong{$_l_Index}; $_l_offset)
						If (SD2_al_ActionVirtFieldDataLong{$_l_Index}=0)
							If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
								//this is a field in the table anyway so get the data from there
								$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
								Case of 
									: (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
										SD2_al_ActionVirtFieldDataLong{$_l_Index}:=Num:C11($_ptr_FieldPointer->)
									: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6)
										SD2_al_ActionVirtFieldDataLong{$_l_Index}:=($_ptr_FieldPointer->)
								End case 
							End if 
							
						End if 
						
					: (SD2_al_ActionVirtFieldType{$_l_Index}=21)  // String one dimension
						BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_at_ActionVirtFieldDataTXT{$_l_Index}; $_l_offset)
						If (SD2_at_ActionVirtFieldDataTXT{$_l_Index}="")
							If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
								//this is a field in the table anyway so get the data from there
								$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
								
								SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=$_ptr_FieldPointer->
								
							End if 
							
						End if 
						
					: (SD2_al_ActionVirtFieldType{$_l_Index}=2)  // TEXT one dimension
						BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_at_ActionVirtFieldDataTXT{$_l_Index}; $_l_offset)
						If (SD2_at_ActionVirtFieldDataTXT{$_l_Index}="")
							If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
								//this is a field in the table anyway so get the data from there
								$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
								
								SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=$_ptr_FieldPointer->
								
							End if 
							
						End if 
						
					: (SD2_al_ActionVirtFieldType{$_l_Index}=1)  // Real one dimension
						BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFieldNumber}; $_l_offset)
						If (SD2_ar_ActionVirtFieldDataREAL{$_l_Index}=0)
							If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
								//this is a field in the table anyway so get the data from there
								$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
								
								SD2_ar_ActionVirtFieldDataREAL{$_l_Index}:=$_ptr_FieldPointer->
								
							End if 
							
						End if 
						
						
					: (SD2_al_ActionVirtFieldType{$_l_Index}=116)  // Longint TWO dimension
						//These are all virtual
						ARRAY LONGINT:C221($_al_Data; 0)
						BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; $_al_Data; $_l_offset)
						INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_Index}; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_Index})+1; Size of array:C274($_al_Data))
						
						For ($_l_ColumnIndex; 1; Size of array:C274($_al_Data))
							SD2_al_ActionVirtFieldDataMANY{$_l_Index}{$_l_ColumnIndex}:=$_al_Data{$_l_ColumnIndex}
						End for 
						
					: (SD2_al_ActionVirtFieldType{$_l_Index}=121)  // String TWO dimension
						//These are all virtual
						ARRAY TEXT:C222($_at_StringData; 0)
						BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; $_at_StringData; $_l_offset)
						INSERT IN ARRAY:C227(SD2_at_ActionVirtFieldDataMA{$_l_Index}; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_Index})+1; Size of array:C274($_at_StringData))
						
						For ($_l_ColumnIndex; 1; Size of array:C274($_at_StringData))
							SD2_at_ActionVirtFieldDataMA{$_l_Index}{$_l_ColumnIndex}:=$_at_StringData{$_l_ColumnIndex}
						End for 
						
						
				End case 
			Else 
				If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
					$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
					Case of 
						: (SD2_al_ActionVirtFieldType{$_l_Index}=9)
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							Case of 
								: (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
									SD2_al_ActionVirtFieldDataLong{$_l_Index}:=Num:C11($_ptr_FieldPointer->)
								: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6)
									SD2_al_ActionVirtFieldDataLong{$_l_Index}:=($_ptr_FieldPointer->)
							End case 
							
						: (SD2_al_ActionVirtFieldType{$_l_Index}=21)
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=$_ptr_FieldPointer->
						: (SD2_al_ActionVirtFieldType{$_l_Index}=2)
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=$_ptr_FieldPointer->
						: (SD2_al_ActionVirtFieldType{$_l_Index}=1)
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							SD2_ar_ActionVirtFieldDataREAL{$_l_Index}:=$_ptr_FieldPointer->
							
					End case 
					
					
				End if 
				
			End if 
			
			
		End for 
		
	Else 
		For ($_l_Index; 1; Size of array:C274(SD2_al_ActionVirtFieldNum))
			$_l_VirtualFieldNumber:=SD2_al_ActionVirtFieldNum{$_l_Index}
			$_t_FieldReferenceName:=SD2_at_ActionVirtFieldName{$_l_Index}
			$_l_Ref:=Find in array:C230($_at_ObjectAttributeNames; $_t_FieldReferenceName)
			
			If ($_l_Ref>0)  //whether it exists or not
				Case of 
					: (SD2_al_ActionVirtFieldType{$_l_Index}=9)  // Longint Value
						If ($_l_Ref>0)
							SD2_al_ActionVirtFieldDataLong{$_l_Index}:=OB Get:C1224($_ptr_Attributes->; $_t_FieldReferenceName; Is longint:K8:6)
						End if 
						//if the value is not filled
						If (SD2_al_ActionVirtFieldDataLong{$_l_Index}=0)
							If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
								//this is a field in the table anyway so get the data from there
								$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
								Case of 
									: (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
										SD2_al_ActionVirtFieldDataLong{$_l_Index}:=Num:C11($_ptr_FieldPointer->)
									: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6)
										SD2_al_ActionVirtFieldDataLong{$_l_Index}:=($_ptr_FieldPointer->)
								End case 
							End if 
							
						End if 
						
					: (SD2_al_ActionVirtFieldType{$_l_Index}=21) | (SD2_al_ActionVirtFieldType{$_l_Index}=2)  // String one dimension
						If ($_l_Ref>0)
							SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=OB Get:C1224($_ptr_Attributes->; $_t_FieldReferenceName; Is text:K8:3)
						End if 
						If (SD2_at_ActionVirtFieldDataTXT{$_l_Index}="")
							If (SD2_al_ActionREALFieldNum{$_l_Index}>0)  //this is a field in the table anyway so get the data from there
								$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
								SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=$_ptr_FieldPointer->
							End if 
						End if 
						
						
					: (SD2_al_ActionVirtFieldType{$_l_Index}=1)  // Real one dimension
						If ($_l_Ref>0)
							SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFieldNumber}:=OB Get:C1224($_ptr_Attributes->; $_t_FieldReferenceName; Is real:K8:4)
						End if 
						If (SD2_ar_ActionVirtFieldDataREAL{$_l_Index}=0)
							If (SD2_al_ActionREALFieldNum{$_l_Index}>0)  //this is a field in the table anyway so get the data from there
								$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
								SD2_ar_ActionVirtFieldDataREAL{$_l_Index}:=$_ptr_FieldPointer->
								
							End if 
							
						End if 
						
						
					: (SD2_al_ActionVirtFieldType{$_l_Index}=116)  // Longint TWO dimension
						//These are all virtual
						INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_Index}; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_Index})+1; 0)
						If ($_l_Ref>0)
							OB GET ARRAY:C1229($_ptr_Attributes->; $_t_FieldReferenceName; SD2_al_ActionVirtFieldDataMANY{$_l_Index})
						End if 
						
						
					: (SD2_al_ActionVirtFieldType{$_l_Index}=121)  // String TWO dimension
						//These are all virtual
						INSERT IN ARRAY:C227(SD2_at_ActionVirtFieldDataMA{$_l_Index}; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_Index})+1; 0)
						If ($_l_Ref>0)
							OB GET ARRAY:C1229($_ptr_Attributes->; $_t_FieldReferenceName; SD2_at_ActionVirtFieldDataMA{$_l_Index})
						End if 
				End case 
			Else 
				//we don't have it in the attributes object-we can get it from the 'real' fields
				If (SD2_al_ActionREALFieldNum{$_l_Index}>0)
					$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
					Case of 
						: (SD2_al_ActionVirtFieldType{$_l_Index}=9)
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							Case of 
								: (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
									SD2_al_ActionVirtFieldDataLong{$_l_Index}:=Num:C11($_ptr_FieldPointer->)
								: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6)
									SD2_al_ActionVirtFieldDataLong{$_l_Index}:=($_ptr_FieldPointer->)
							End case 
							
						: (SD2_al_ActionVirtFieldType{$_l_Index}=21) | (SD2_al_ActionVirtFieldType{$_l_Index}=2)
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							SD2_at_ActionVirtFieldDataTXT{$_l_Index}:=$_ptr_FieldPointer->
							
						: (SD2_al_ActionVirtFieldType{$_l_Index}=1)
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Index})
							SD2_ar_ActionVirtFieldDataREAL{$_l_Index}:=$_ptr_FieldPointer->
							
					End case 
					
					
				End if 
				
			End if 
			
			
		End for 
		
		
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SD2_ActionAttributesToArrays"; $_t_oldMethodName)
