const groups = [
  {
    id: 'package',
    title: 'Package Manager',
    options: [
      {id: 'brew', title: 'Homebrew', checked: true},
      {id: 'choco', title: 'Chocolatey'}, {id: 'snap', title: 'Snapcraft'},
      {id: 'go', title: 'Go'}
    ]
  },
]
const qs = new Quickstart('#quickstart', groups)
