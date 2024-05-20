import { ChangeEvent, useState } from 'react'
import { Button } from '@hello/ui'
import { greet } from '@hello/utils'

function App() {
  const [name, setName] = useState('');

  const handleNameChange = (e: ChangeEvent<HTMLInputElement>): void => {
    setName(e.target.value);
  };


  return (
    <div>
      <input type='text' value={name} onChange={(e) => handleNameChange(e)} />
      <Button onClick={() => {
        alert(greet(name));
      }}>Greet</Button>
    </div>
  )
}

export default App