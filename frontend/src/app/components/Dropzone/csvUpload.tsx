'use client'

import { useMutation, useQueryClient } from '@tanstack/react-query'
import { useRouter } from 'next/navigation'
import React, {useCallback} from 'react'
import {useDropzone} from 'react-dropzone'
import router from "@/app/api/router"
import { Card, CardContent, Typography } from '@mui/material'

export default function MyDropzone() {
  const userouter = useRouter()
  const queryClient = useQueryClient()
  const importMutation = useMutation({
    mutationFn: router.uploadData.importFromCsv,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['getPeople'] })
      userouter.push('/')
    },
  })
  const onDrop = useCallback((acceptedFiles: File[]) => {
    acceptedFiles.forEach((file) => {
      const reader = new FileReader()
      reader.onload = () => {
      // Do whatever you want with the file contents
        importMutation.mutate(reader.result as ArrayBuffer)
      }
      reader.readAsText(file)
    })
    
  }, [importMutation])
  const {getRootProps, getInputProps} = useDropzone({onDrop})

  return (
    <Card sx={{
      p: 2,
      textAlign: 'center'}} {...getRootProps()}>
      <CardContent>
        <input {...getInputProps()} />
        <Typography variant="body1" sx={{fontWeight: 'light'}}>
          CSV File Upload
        </Typography>
        <Typography variant="body2" sx={{fontWeight: 'light'}}>
          Drag and Drop, or click to upload
        </Typography>
      </CardContent>
    </Card>
  )
}