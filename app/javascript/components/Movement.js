import React from 'react'

class App extends React.Component {
	render () {
		let tr = (<tr>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					</tr>);
		return (
			<div>
				<div>Hello Robot</div>
				<table className='table table-bordered'>
					<tbody>
						{tr}
						{tr}
						{tr}
						{tr}
						{tr}
					</tbody>
				</table>
			</div>
		)
	}
}

export default App