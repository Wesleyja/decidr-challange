declare namespace APISchema {
	type Affiliation = {
		id: number;
		name?: string;
		createdAt: string;
		updatedAt: string;
		people?: Person[];
	}

	type Location = {
		id: number;
		name?: string;
		createdAt: string;
		updatedAt: string;
		people?: Person[];
	}

	type Person = {
		id: number;
		species?: string;
		gender?: 'male'|'female'|'other';
		weapon?: string;
		vehicle?: string;
		firstName?: string;
		lastName?: string;
		createdAt: string;
		updatedAt: string;
		affiliations?: Affiliation[];
		locations?: Location[];
	}


}
