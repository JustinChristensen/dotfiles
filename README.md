# dotfiles

## Installing Dependencies

	# clone
	cd ~
	git clone dotfiles

	# install GNU stow
	brew install stow
	
## Running

	# link everything
	cd dotfiles
	stow darwin

	# start a new term session
	# run setup
	dotfiles

## Uninstall

	# unlink everything
	stow -D darwin
