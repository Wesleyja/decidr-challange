'use client'

import { useMutation, useQueryClient } from '@tanstack/react-query'
import { useRouter } from 'next/navigation'
import React from 'react'
import router from "@/app/api/router"
import { Button } from '@mui/material'
import CloudUploadIcon from '@mui/icons-material/CloudUpload';

export default function DefaultCsvUpload() {
  const userouter = useRouter()
  const queryClient = useQueryClient()
  const importMutation = useMutation({
    mutationFn: router.uploadData.defaultCsv,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['getPeople'] })
      console.log('redirect!!')
      userouter.push('/')
    },
  })

  return (
    <Button
      onClick={() => {
        importMutation.mutate();
      }}
      startIcon={<CloudUploadIcon />}
    >
      Default Csv Import
    </Button>

  )
}