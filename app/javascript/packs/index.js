import React from 'react'
import ReactDOM from 'react-dom'
import Movement from '../components/Movement'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Movement/>,
    document.body.appendChild(document.createElement('div')),
  )
})
